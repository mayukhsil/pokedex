import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/core/styles/type_colors.dart';
import 'package:pokedex/core/theme/app_theme.dart';
import 'package:pokedex/models/pokemon_detail.dart';
import 'package:pokedex/models/pokemon_list_response.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';
import 'package:pokedex/services/hive_service.dart';
import 'package:pokedex/services/network_service.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Infrastructure providers (private — not exported)
//
// These are the only providers that touch service singletons directly.
// Feature providers must read [pokemonRepositoryProvider] instead.
// ─────────────────────────────────────────────────────────────────────────────

final _networkServiceProvider = Provider<NetworkService>(
  (_) => NetworkService(),
  name: 'networkService',
);

/// Exposes the [HiveService] singleton.
///
/// Kept public so [ThemeNotifier] (in `theme_provider.dart`) can read the
/// settings box independently of [PokemonRepository].
final hiveServiceProvider = Provider<HiveService>(
  (_) => HiveService(),
  name: 'hiveService',
);

// ─────────────────────────────────────────────────────────────────────────────
// Repository provider
// ─────────────────────────────────────────────────────────────────────────────

/// Singleton [PokemonRepository] composed from the private infrastructure providers.
///
/// This is the **only** provider that feature notifiers should depend on for
/// Pokémon data. It enforces the architecture boundary between state and I/O.
final pokemonRepositoryProvider = Provider<PokemonRepository>(
  (ref) => PokemonRepository(
    network: ref.read(_networkServiceProvider),
    cache: ref.read(hiveServiceProvider),
  ),
  name: 'pokemonRepository',
);

// ─────────────────────────────────────────────────────────────────────────────
// Pokémon list — cache-first with background refresh
// ─────────────────────────────────────────────────────────────────────────────

/// Provides the paginated list of [PokemonEntry] objects shown on the home grid.
///
/// Data flow on first app open:
/// 1. Check Hive — if hit, return immediately (no visible loading spinner).
/// 2. Kick off a background network refresh; merge result silently if changed.
///
/// On first install (empty cache):
/// 1. Fetch page 1 from network (shows loading indicator).
/// 2. Persist result to Hive.
///
/// Use [PokemonListNotifier.fetchMore] to load additional pages on scroll, and
/// [PokemonListNotifier.refresh] for a manual pull-to-refresh.
final pokemonListProvider =
    AsyncNotifierProvider<PokemonListNotifier, List<PokemonEntry>>(
      PokemonListNotifier.new,
    );

/// Notifier backing [pokemonListProvider].
///
/// Owns:
/// - The cache-first loading strategy (via [PokemonRepository]).
/// - Pagination cursor (`_offset`).
/// - Background refresh logic.
class PokemonListNotifier extends AsyncNotifier<List<PokemonEntry>> {
  int _offset = 0;
  bool _hasMore = true;
  bool _isFetchingMore = false;

  /// Whether any further pages are available on the server.
  bool get hasMore => _hasMore;

  /// `true` while a pagination request is in-flight.
  bool get isFetchingMore => _isFetchingMore;

  PokemonRepository get _repo => ref.read(pokemonRepositoryProvider);

  @override
  Future<List<PokemonEntry>> build() async {
    // ── 1. Cache-first: show instantly without a spinner ──────────────────
    final cached = await _repo.getCachedList();
    if (cached != null && cached.isNotEmpty) {
      _offset = cached.length;
      _hasMore = true;
      _backgroundRefresh(); // fire-and-forget — does not block the UI
      return cached;
    }

    // ── 2. First launch: normal network fetch ─────────────────────────────
    final response = await _repo.fetchPage();
    _offset = response.results.length;
    _hasMore = response.next != null;
    await _repo.persistList(response.results);
    return response.results;
  }

  /// Silently fetches the latest page-1 data and merges it into [state] if
  /// the server data differs from what is cached. Errors are swallowed —
  /// cached data is already displayed and the user is unaware of failures.
  Future<void> _backgroundRefresh() async {
    try {
      final response = await _repo.fetchPage(offset: 0);
      _hasMore = response.next != null;

      final current = state.valueOrNull ?? [];
      final fresh = response.results;

      if (current.length < fresh.length ||
          (current.isNotEmpty && current.first.name != fresh.first.name)) {
        _offset = fresh.length;
        state = AsyncData(fresh);
      }

      await _repo.persistList(state.valueOrNull ?? fresh);
    } catch (_) {
      // Cached data is already displayed — silently swallow
    }
  }

  /// Loads the next page and appends it to the current list.
  ///
  /// No-op if [hasMore] is `false` or a request is already in-flight.
  /// Called by [HomeView] when the scroll position nears the bottom.
  Future<void> fetchMore() async {
    if (!_hasMore || _isFetchingMore) return;
    _isFetchingMore = true;
    final current = state.valueOrNull ?? [];

    try {
      final response = await _repo.fetchPage(offset: _offset);
      _offset += response.results.length;
      _hasMore = response.next != null;
      _isFetchingMore = false;

      final merged = [...current, ...response.results];
      state = AsyncData(merged);
      await _repo.persistList(merged);
    } catch (_) {
      _isFetchingMore = false;
    }
  }

  /// Forces a full reload from the network, discarding any cached state.
  ///
  /// Sets [state] to [AsyncLoading] while the request is in-flight so the UI
  /// shows a progress indicator.
  Future<void> refresh() async {
    _offset = 0;
    _hasMore = true;
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final response = await _repo.fetchPage();
      _offset = response.results.length;
      _hasMore = response.next != null;
      await _repo.persistList(response.results);
      return response.results;
    });
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Pokémon detail
// ─────────────────────────────────────────────────────────────────────────────

/// Fetches full detail for the Pokémon identified by [nameOrId].
///
/// Results are kept alive by Riverpod's provider cache for the lifetime of the
/// app session — tapping a card pre-warms the cache so navigating back and
/// forward incurs no additional network round-trip.
final pokemonDetailProvider = FutureProvider.family<PokemonDetail, String>(
  (ref, nameOrId) => ref.read(pokemonRepositoryProvider).fetchDetail(nameOrId),
);

// ─────────────────────────────────────────────────────────────────────────────
// Type colour (derived)
// ─────────────────────────────────────────────────────────────────────────────

/// Returns the primary type [Color] for the Pokémon with the given [id].
///
/// Derived from [pokemonDetailProvider] — no extra network call. Riverpod
/// caches the detail result, so this provider adds zero overhead once the
/// detail is loaded.
///
/// Falls back to [AppTheme.cardFallback] if the type name is unrecognised or
/// the detail is still loading. The card renders the fallback colour instantly
/// and updates automatically when the type resolves.
final pokemonTypeColorProvider = FutureProvider.family<Color, int>((
  ref,
  id,
) async {
  final detail = await ref.watch(pokemonDetailProvider(id.toString()).future);
  final typeName = detail.types.firstOrNull?.type.name ?? '';
  return TypeColors.forType(typeName) ?? AppTheme.cardFallback;
});
