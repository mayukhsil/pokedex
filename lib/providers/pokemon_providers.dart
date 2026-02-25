import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/core/styles/type_colors.dart';
import 'package:pokedex/core/theme/app_theme.dart';
import 'package:pokedex/models/pokemon_detail.dart';
import 'package:pokedex/models/pokemon_list_response.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';
import 'package:pokedex/services/hive_service.dart';
import 'package:pokedex/services/network_service.dart';

// ── Infrastructure providers ──────────────────────────────────────────────────
// These are the only places in the app that touch service classes directly.

final _networkServiceProvider = Provider<NetworkService>(
  (_) => NetworkService(),
  name: 'networkService',
);

final hiveServiceProvider = Provider<HiveService>(
  (_) => HiveService(),
  name: 'hiveService',
);

// ── Repository provider ───────────────────────────────────────────────────────
/// Single instance of [PokemonRepository] — composed from infrastructure providers.
/// All feature providers below depend only on this.
final pokemonRepositoryProvider = Provider<PokemonRepository>(
  (ref) => PokemonRepository(
    network: ref.read(_networkServiceProvider),
    cache: ref.read(hiveServiceProvider),
  ),
  name: 'pokemonRepository',
);

// ── Pokémon list (cache-first + background refresh) ───────────────────────────
final pokemonListProvider =
    AsyncNotifierProvider<PokemonListNotifier, List<PokemonEntry>>(
      PokemonListNotifier.new,
    );

class PokemonListNotifier extends AsyncNotifier<List<PokemonEntry>> {
  int _offset = 0;
  bool _hasMore = true;
  bool _isFetchingMore = false;

  bool get hasMore => _hasMore;
  bool get isFetchingMore => _isFetchingMore;

  PokemonRepository get _repo => ref.read(pokemonRepositoryProvider);

  @override
  Future<List<PokemonEntry>> build() async {
    // ── 1. Cache-first: show instantly without a spinner ──────────────────
    final cached = await _repo.getCachedList();
    if (cached != null && cached.isNotEmpty) {
      _offset = cached.length;
      _hasMore = true;
      _backgroundRefresh(); // silent update, does not block
      return cached;
    }

    // ── 2. First launch: normal network fetch ─────────────────────────────
    final response = await _repo.fetchPage();
    _offset = response.results.length;
    _hasMore = response.next != null;
    await _repo.persistList(response.results);
    return response.results;
  }

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

// ── Pokémon detail ────────────────────────────────────────────────────────────
final pokemonDetailProvider = FutureProvider.family<PokemonDetail, String>(
  (ref, nameOrId) => ref.read(pokemonRepositoryProvider).fetchDetail(nameOrId),
);

// ── Primary type colour (derived, Riverpod-cached) ────────────────────────────
final pokemonTypeColorProvider = FutureProvider.family<Color, int>((
  ref,
  id,
) async {
  final detail = await ref.watch(pokemonDetailProvider(id.toString()).future);
  final typeName = detail.types.firstOrNull?.type.name ?? '';
  return TypeColors.forType(typeName) ?? AppTheme.cardFallback;
});
