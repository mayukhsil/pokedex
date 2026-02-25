import 'package:flutter/material.dart';

/// Maps each of the 18 Pokémon element types to its characteristic brand colour.
///
/// Colours are sourced from the official Pokémon Scarlet / Violet type chart
/// palette and are used throughout the app for card borders, detail headers,
/// section accents, and type badge chips.
///
/// Usage:
/// ```dart
/// final color = TypeColors.forType('fire');  // Color(0xFFEE8130) or null
/// ```
class TypeColors {
  /// Internal lookup — all type names stored in lowercase to match API responses.
  static const Map<String, Color> _typeMap = {
    'normal': Color(0xFFA8A77A),
    'fire': Color(0xFFEE8130),
    'water': Color(0xFF6390F0),
    'electric': Color(0xFFF7D02C),
    'grass': Color(0xFF7AC74C),
    'ice': Color(0xFF96D9D6),
    'fighting': Color(0xFFC22E28),
    'poison': Color(0xFFA33EA1),
    'ground': Color(0xFFE2BF65),
    'flying': Color(0xFFA98FF3),
    'psychic': Color(0xFFF95587),
    'bug': Color(0xFFA6B91A),
    'rock': Color(0xFFB6A136),
    'ghost': Color(0xFF735797),
    'dragon': Color(0xFF6F35FC),
    'dark': Color(0xFF705746),
    'steel': Color(0xFFB7B7CE),
    'fairy': Color(0xFFD685AD),
  };

  /// Returns the colour for [type] (case-insensitive), or `null` if the type
  /// name is unrecognised (e.g. a future API addition or a typo).
  ///
  /// Callers should fall back to [AppTheme.cardFallback] when this returns `null`.
  static Color? forType(String type) => _typeMap[type.toLowerCase()];

  /// Stub for a future name-based heuristic. Currently always returns `null`
  /// — type colour requires a detail fetch.
  static Color? typeColorFor(String name) =>
      null; // resolved after detail fetch
}
