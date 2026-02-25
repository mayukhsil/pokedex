import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedex/models/pokemon_list_response.dart';

/// Thin wrapper around [Hive] for all local persistence.
///
/// Two boxes are used to keep concerns separate:
///
/// | Box | Key | Value | Purpose |
/// |---|---|---|---|
/// | `pokemon_list_box` | `"pokemon_list"` | `List<String>` (JSON) | Cached Pokémon list |
/// | `settings_box` | `"is_dark_mode"` | `bool` | User theme preference |
///
/// Call [init] once during app startup (before [runApp]) to open both boxes.
/// After that every read operation is synchronous.
class HiveService {
  static const String _pokemonListBox = 'pokemon_list_box';
  static const String _settingsBox = 'settings_box';

  static const String _pokemonListKey = 'pokemon_list';
  static const String _themeModeKey = 'is_dark_mode';

  /// Opens both Hive boxes. Must be awaited before the app renders.
  ///
  /// Safe to call on every cold start — Hive is idempotent if the box is
  /// already open.
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(_pokemonListBox);
    await Hive.openBox(_settingsBox);
  }

  // ── Pokémon list ───────────────────────────────────────────────────────────

  /// Persists [entries] to disk as a JSON-encoded string list.
  ///
  /// Called after every successful network page load so the cache always
  /// reflects the growing in-memory list.
  Future<void> savePokemonList(List<PokemonEntry> entries) async {
    final box = Hive.box(_pokemonListBox);
    final encoded = entries.map((e) => jsonEncode(e.toJson())).toList();
    await box.put(_pokemonListKey, encoded);
  }

  /// Decodes and returns the cached Pokémon list.
  ///
  /// Returns `null` on first launch (box exists but key is absent).
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

  /// Deletes the cached list. Used for full cache invalidation (e.g. testing).
  Future<void> clearPokemonList() async {
    final box = Hive.box(_pokemonListBox);
    await box.delete(_pokemonListKey);
  }

  // ── Theme preference ───────────────────────────────────────────────────────

  /// Synchronously reads the persisted dark-mode preference.
  ///
  /// Returns `null` if the user has never explicitly set a theme, in which
  /// case [ThemeNotifier] falls back to [ThemeMode.system].
  bool? loadIsDark() {
    return Hive.box(_settingsBox).get(_themeModeKey) as bool?;
  }

  /// Persists [isDark] so the next cold start restores the correct theme
  /// without any UI flicker.
  Future<void> saveIsDark(bool isDark) async {
    await Hive.box(_settingsBox).put(_themeModeKey, isDark);
  }
}
