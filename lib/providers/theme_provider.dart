import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/providers/pokemon_providers.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Theme provider
// ─────────────────────────────────────────────────────────────────────────────

/// Provides and persists the app's [ThemeMode].
///
/// **Reading the current mode** (in any widget):
/// ```dart
/// final mode = ref.watch(themeProvider); // ThemeMode
/// ```
///
/// **Changing the mode** (used by the POKÉDEX title gesture in [HomeView]):
/// ```dart
/// ref.read(themeProvider.notifier).toggle();   // light ↔ dark
/// ref.read(themeProvider.notifier).setDark();
/// ref.read(themeProvider.notifier).setLight();
/// ```
///
/// The preference is persisted to Hive (`settings_box / "is_dark_mode"`) so
/// the user's choice is restored immediately on the next cold start — no flicker.
final themeProvider = NotifierProvider<ThemeNotifier, ThemeMode>(
  ThemeNotifier.new,
);

/// Notifier backing [themeProvider].
///
/// [build] reads from Hive synchronously (the box is already open by the time
/// the notifier is first read, because [HiveService.init] is awaited in
/// `main()`). This means the correct [ThemeMode] is wired into [MaterialApp]
/// before the first frame is painted.
class ThemeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    // Box is already open — synchronous read is safe.
    final isDark = ref.read(hiveServiceProvider).loadIsDark();
    if (isDark == null) {
      return ThemeMode.system; // Never explicitly set → follow OS
    }
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  /// Toggles between [ThemeMode.light] and [ThemeMode.dark].
  ///
  /// If the current mode is [ThemeMode.system] (never explicitly set),
  /// toggling moves to [ThemeMode.dark] first.
  Future<void> toggle() async {
    final next = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await _apply(next);
  }

  /// Switches to [ThemeMode.dark] and persists the preference.
  Future<void> setDark() async => _apply(ThemeMode.dark);

  /// Switches to [ThemeMode.light] and persists the preference.
  Future<void> setLight() async => _apply(ThemeMode.light);

  Future<void> _apply(ThemeMode mode) async {
    state = mode;
    await ref.read(hiveServiceProvider).saveIsDark(mode == ThemeMode.dark);
  }
}
