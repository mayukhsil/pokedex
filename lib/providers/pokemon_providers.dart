import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/core/styles/type_colors.dart';
import 'package:pokedex/core/theme/app_theme.dart';
import 'package:pokedex/services/network_service.dart';
import 'package:pokedex/models/pokemon_detail.dart';
import 'package:pokedex/models/pokemon_list_response.dart';
import 'package:pokedex/services/hive_service.dart';

// ── Service providers ─────────────────────────────────────────────────────────
final networkServiceProvider = Provider<NetworkService>(
  (ref) => NetworkService(),
);
final hiveServiceProvider = Provider<HiveService>((ref) => HiveService());

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

  @override
  Future<List<PokemonEntry>> build() async {
    final hive = ref.read(hiveServiceProvider);

    // ── 1. Try cache first (instant load, no spinner) ─────────────────────
    final cached = await hive.loadPokemonList();
    if (cached != null && cached.isNotEmpty) {
      // Publish cached data immediately …
      _offset = cached.length;
      _hasMore = true; // assume more until proven otherwise

      // … then kick off a background refresh without blocking the UI
      _backgroundRefresh();

      return cached;
    }

    // ── 2. First launch — no cache — fetch from network normally ──────────
    final response = await ref.read(networkServiceProvider).fetchPokemonList();
    _offset = response.results.length;
    _hasMore = response.next != null;
    await hive.savePokemonList(response.results);
    return response.results;
  }

  // ── Background refresh: fetch fresh page-1 and merge/update state ─────────
  Future<void> _backgroundRefresh() async {
    try {
      final response = await ref
          .read(networkServiceProvider)
          .fetchPokemonList(offset: 0);
      _hasMore = response.next != null;

      // Only update state if the fresh data differs from what we have
      final current = state.valueOrNull ?? [];
      if (current.length < response.results.length ||
          (current.isNotEmpty &&
              current.first.name != response.results.first.name)) {
        _offset = response.results.length;
        state = AsyncData(response.results);
      }

      // Persist fresh data
      await ref
          .read(hiveServiceProvider)
          .savePokemonList(state.valueOrNull ?? response.results);
    } catch (_) {
      // Silently ignore — cached data is already showing
    }
  }

  // ── Pagination ────────────────────────────────────────────────────────────
  Future<void> fetchMore() async {
    if (!_hasMore || _isFetchingMore) return;
    _isFetchingMore = true;

    final current = state.valueOrNull ?? [];

    try {
      final response = await ref
          .read(networkServiceProvider)
          .fetchPokemonList(offset: _offset);

      _offset += response.results.length;
      _hasMore = response.next != null;
      _isFetchingMore = false;

      final merged = [...current, ...response.results];
      state = AsyncData(merged);

      // Persist the growing list
      await ref.read(hiveServiceProvider).savePokemonList(merged);
    } catch (e) {
      _isFetchingMore = false;
    }
  }

  // ── Manual pull-to-refresh ────────────────────────────────────────────────
  Future<void> refresh() async {
    _offset = 0;
    _hasMore = true;
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final response =
          await ref.read(networkServiceProvider).fetchPokemonList();
      _offset = response.results.length;
      _hasMore = response.next != null;
      await ref.read(hiveServiceProvider).savePokemonList(response.results);
      return response.results;
    });
  }
}

// ── Pokémon detail ────────────────────────────────────────────────────────────
final pokemonDetailProvider = FutureProvider.family<PokemonDetail, String>(
  (ref, nameOrId) =>
      ref.read(networkServiceProvider).fetchPokemonDetail(nameOrId),
);

// ── Pokemon primary type color (lightweight, cached by Riverpod) ──────────────
/// Resolves the primary type color for a given pokemon [id].
/// Reuses [pokemonDetailProvider]'s cache — tapping a card pre-warms the cache
/// so subsequent home/detail visits incur no extra network call.
final pokemonTypeColorProvider = FutureProvider.family<Color, int>((
  ref,
  id,
) async {
  final detail = await ref.watch(pokemonDetailProvider(id.toString()).future);
  final typeName = detail.types.firstOrNull?.type.name ?? '';
  return TypeColors.forType(typeName) ?? AppTheme.cardFallback;
});
