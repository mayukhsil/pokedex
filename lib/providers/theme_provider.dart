import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/providers/pokemon_providers.dart';

// ── Theme provider ────────────────────────────────────────────────────────────
final themeProvider = NotifierProvider<ThemeNotifier, ThemeMode>(
  ThemeNotifier.new,
);

class ThemeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    // Box is already open — read synchronously
    final isDark = ref.read(hiveServiceProvider).loadIsDark();
    if (isDark == null) return ThemeMode.system;
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  /// Flip between light ↔ dark. Falls back from system to light first.
  Future<void> toggle() async {
    final next = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await _apply(next);
  }

  Future<void> setDark() async => _apply(ThemeMode.dark);
  Future<void> setLight() async => _apply(ThemeMode.light);

  Future<void> _apply(ThemeMode mode) async {
    state = mode;
    await ref.read(hiveServiceProvider).saveIsDark(mode == ThemeMode.dark);
  }
}

// Re-export hiveServiceProvider here so ThemeNotifier can read it.
// (The canonical definition stays in pokemon_providers.dart — we import it.)
