import 'package:pokedex/models/pokemon_detail.dart';
import 'package:pokedex/models/pokemon_list_response.dart';
import 'package:pokedex/services/hive_service.dart';
import 'package:pokedex/services/network_service.dart';

/// The single data-access boundary between feature code and infrastructure.
///
/// **Architecture rule**: Riverpod providers and notifiers may only call
/// [PokemonRepository] to read or write Pokémon data. Direct calls to
/// [NetworkService] or [HiveService] from providers are not permitted.
///
/// This separation means:
/// - The cache strategy (cache-first, bg-refresh, pagination) lives in the
///   notifiers, not here.
/// - Swapping the HTTP client or persistence layer only requires changing
///   this file and the service implementations.
///
/// Constructed via [pokemonRepositoryProvider] — ask Riverpod for an instance,
/// never instantiate directly in feature code.
class PokemonRepository {
  const PokemonRepository({
    required NetworkService network,
    required HiveService cache,
  }) : _network = network,
       _cache = cache;

  final NetworkService _network;
  final HiveService _cache;

  // ── List ──────────────────────────────────────────────────────────────────

  /// Returns the locally-cached Pokémon entry list from Hive.
  ///
  /// Returns `null` on first launch (no cache exists yet). The caller
  /// ([PokemonListNotifier]) treats `null` as "go network immediately".
  Future<List<PokemonEntry>?> getCachedList() => _cache.loadPokemonList();

  /// Fetches a single page of 20 Pokémon from the network.
  ///
  /// [offset] is zero-based: `0` = page 1, `20` = page 2, etc.
  /// Check [PokemonListResponse.next] to know whether more pages exist.
  Future<PokemonListResponse> fetchPage({int offset = 0}) =>
      _network.fetchPokemonList(offset: offset);

  /// Writes [entries] to Hive. Called after every successful page load so
  /// the growing list is always preserved across restarts.
  Future<void> persistList(List<PokemonEntry> entries) =>
      _cache.savePokemonList(entries);

  /// Deletes the cached list from Hive. Exposed for testing / debug only.
  Future<void> clearCache() => _cache.clearPokemonList();

  // ── Detail ────────────────────────────────────────────────────────────────

  /// Fetches full Pokémon detail by [nameOrId] (e.g. `"25"` or `"pikachu"`).
  ///
  /// Results are **not** cached at this layer — Riverpod's [FutureProvider]
  /// keeps the result alive for the lifetime of the provider, providing
  /// free in-memory caching for the session.
  Future<PokemonDetail> fetchDetail(String nameOrId) =>
      _network.fetchPokemonDetail(nameOrId);
}
