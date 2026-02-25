import 'package:pokedex/models/pokemon_detail.dart';
import 'package:pokedex/models/pokemon_list_response.dart';
import 'package:pokedex/services/hive_service.dart';
import 'package:pokedex/services/network_service.dart';

/// The single point of contact for all Pokémon data.
///
/// Owns the cache-first strategy so that [PokemonListNotifier] and
/// [pokemonDetailProvider] deal only with domain objects — never raw
/// service calls or cache keys.
class PokemonRepository {
  const PokemonRepository({
    required NetworkService network,
    required HiveService cache,
  }) : _network = network,
       _cache = cache;

  final NetworkService _network;
  final HiveService _cache;

  // ── List ──────────────────────────────────────────────────────────────────

  /// Returns the locally-cached entry list, or `null` on first launch.
  Future<List<PokemonEntry>?> getCachedList() => _cache.loadPokemonList();

  /// Fetches a single page from the network.
  Future<PokemonListResponse> fetchPage({int offset = 0}) =>
      _network.fetchPokemonList(offset: offset);

  /// Persists [entries] to local storage.
  Future<void> persistList(List<PokemonEntry> entries) =>
      _cache.savePokemonList(entries);

  /// Force-clears the local list cache.
  Future<void> clearCache() => _cache.clearPokemonList();

  // ── Detail ────────────────────────────────────────────────────────────────

  /// Fetches full detail for a Pokémon by name or numeric ID string.
  Future<PokemonDetail> fetchDetail(String nameOrId) =>
      _network.fetchPokemonDetail(nameOrId);
}
