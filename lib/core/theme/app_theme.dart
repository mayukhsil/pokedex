import 'package:flutter/material.dart';

/// Single source of truth for all visual design decisions.
///
/// **Usage**
/// ```dart
/// MaterialApp(
///   theme:     AppTheme.light,
///   darkTheme: AppTheme.dark,
///   themeMode: ref.watch(themeProvider),
/// );
/// ```
///
/// **Design language** — boxy minimalist:
/// - Near-square corners ([boxyRadiusPx] = 6 px, adjust to taste).
/// - Bold type-coloured borders instead of gradients.
/// - No elevation shadows in dark mode; subtle shadows in light mode.
///
/// **Adding a new token** — put it here as a `static const`, then reference it
/// in widgets instead of hardcoding hex values or radii.
abstract final class AppTheme {
  // ─────────────────────────────────────────────────────────────────────────
  // Brand colours
  // ─────────────────────────────────────────────────────────────────────────

  /// Primary brand red — used for the home AppBar accent bar and filled buttons.
  static const Color brandRed = Color(0xFFE94560);

  /// Dark theme scaffold background.
  static const Color darkSurface = Color(0xFF1A1A2E);

  /// Dark theme AppBar and card surface colour.
  static const Color darkAppBar = Color(0xFF16213E);

  /// Gradient start colour (legacy — kept for potential reuse).
  static const Color darkGradientStart = Color(0xFF0F3460);

  /// Fallback card colour shown while the true type colour loads.
  ///
  /// Displayed for at most one frame — replaced by the real type colour once
  /// [pokemonTypeColorProvider] resolves.
  static const Color cardFallback = Color(0xFF4A90A4);

  // ─────────────────────────────────────────────────────────────────────────
  // Boxy design language tokens
  // ─────────────────────────────────────────────────────────────────────────

  /// Corner radius applied uniformly to cards, chips, buttons, and inputs.
  ///
  /// Set to `0` for fully square, or `12`+ for a rounded look.
  static const double boxyRadiusPx = 6.0;

  /// Pre-built [BorderRadius] for use in [BoxDecoration] and [ClipRRect].
  static const BorderRadius boxyRadius = BorderRadius.all(
    Radius.circular(boxyRadiusPx),
  );

  /// Thickness of the type-coloured border on [PokemonCard].
  static const double cardBorderWidth = 2.5;

  static ShapeBorder get _boxyCardShape =>
      RoundedRectangleBorder(borderRadius: boxyRadius);

  // ─────────────────────────────────────────────────────────────────────────
  // Font helpers
  // ─────────────────────────────────────────────────────────────────────────

  /// Creates a [TextStyle] using the bundled Nunito variable font.
  ///
  /// Drop-in replacement for `GoogleFonts.nunito(...)` — no network required.
  static TextStyle nunito({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
  }) => TextStyle(
    fontFamily: 'Nunito',
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    letterSpacing: letterSpacing,
    height: height,
    decoration: decoration,
  );

  /// Returns a full [TextTheme] backed by the bundled Nunito variable font.
  ///
  /// Applies the Nunito family to every text style in [base] so that all
  /// default Flutter text widgets use the correct typeface without any
  /// per-widget `fontFamily` override.
  static TextTheme _textTheme(TextTheme base) =>
      base.apply(fontFamily: 'Nunito');

  // ─────────────────────────────────────────────────────────────────────────
  // Light theme (default — white scaffold)
  // ─────────────────────────────────────────────────────────────────────────

  /// Material 3 light theme.
  ///
  /// - White scaffold + app bar.
  /// - Cards: white, zero elevation, [boxyRadius] corners.
  /// - Buttons and inputs: [brandRed] accent, [boxyRadius] borders.
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: brandRed,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: _textTheme(ThemeData.light().textTheme),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: darkSurface,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      shape: _boxyCardShape,
    ),
    dividerColor: Colors.black12,
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: brandRed),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: brandRed,
        shape: RoundedRectangleBorder(borderRadius: boxyRadius),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: boxyRadius),
      focusedBorder: OutlineInputBorder(
        borderRadius: boxyRadius,
        borderSide: const BorderSide(color: brandRed, width: 2),
      ),
    ),
  );

  // ─────────────────────────────────────────────────────────────────────────
  // Dark theme
  // ─────────────────────────────────────────────────────────────────────────

  /// Material 3 dark theme.
  ///
  /// - [darkSurface] scaffold, [darkAppBar] app bar and card surfaces.
  /// - Zero elevation everywhere (depth conveyed through colour, not shadow).
  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: brandRed,
      brightness: Brightness.dark,
      surface: darkSurface,
    ),
    scaffoldBackgroundColor: darkSurface,
    textTheme: _textTheme(ThemeData.dark().textTheme),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkAppBar,
      foregroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    cardTheme: CardThemeData(
      color: darkAppBar,
      elevation: 0,
      shape: _boxyCardShape,
    ),
    dividerColor: Colors.white12,
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: brandRed),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: brandRed,
        shape: RoundedRectangleBorder(borderRadius: boxyRadius),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: boxyRadius),
      focusedBorder: OutlineInputBorder(
        borderRadius: boxyRadius,
        borderSide: const BorderSide(color: brandRed, width: 2),
      ),
    ),
  );
}
