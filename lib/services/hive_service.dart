import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedex/models/pokemon_list_response.dart';

/// Wrapper around Hive for all local persistence needs.
class HiveService {
  static const String _pokemonListBox = 'pokemon_list_box';
  static const String _pokemonListKey = 'pokemon_list';

  /// Must be called once before the app starts (in main).
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(_pokemonListBox);
  }

  // ── Pokemon list ───────────────────────────────────────────────────────────

  /// Persist a list of [PokemonEntry] entries to Hive.
  Future<void> savePokemonList(List<PokemonEntry> entries) async {
    final box = Hive.box(_pokemonListBox);
    final encoded = entries.map((e) => jsonEncode(e.toJson())).toList();
    await box.put(_pokemonListKey, encoded);
  }

  /// Load cached [PokemonEntry] list. Returns `null` if the cache is empty.
  Future<List<PokemonEntry>?> loadPokemonList() async {
    final box = Hive.box(_pokemonListBox);
    final raw = box.get(_pokemonListKey);
    if (raw == null) return null;
    final list = (raw as List).cast<String>();
    return list
        .map(
          (s) => PokemonEntry.fromJson(jsonDecode(s) as Map<String, dynamic>),
        )
        .toList();
  }

  /// Clear all cached Pokémon list data.
  Future<void> clearPokemonList() async {
    final box = Hive.box(_pokemonListBox);
    await box.delete(_pokemonListKey);
  }
}
