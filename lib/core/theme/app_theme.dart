import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Single source of truth for all theme configuration.
/// Access via [AppTheme.light] and [AppTheme.dark].
abstract final class AppTheme {
  // ─────────────────────────────────────────────────────────────────────────
  // Brand colours
  // ─────────────────────────────────────────────────────────────────────────
  static const Color brandRed = Color(0xFFE94560);
  static const Color darkSurface = Color(0xFF1A1A2E);
  static const Color darkAppBar = Color(0xFF16213E);
  static const Color darkGradientStart = Color(0xFF0F3460);
  static const Color cardFallback = Color(0xFF4A90A4);

  // ─────────────────────────────────────────────────────────────────────────
  // Design language — boxy minimalist
  // ─────────────────────────────────────────────────────────────────────────
  static const double boxyRadiusPx = 6.0;
  static const BorderRadius boxyRadius = BorderRadius.all(
    Radius.circular(boxyRadiusPx),
  );
  static const double cardBorderWidth = 2.5;

  static ShapeBorder get _boxyCardShape =>
      RoundedRectangleBorder(borderRadius: boxyRadius);

  static TextTheme _textTheme(Brightness brightness) =>
      GoogleFonts.nunitoTextTheme(
        brightness == Brightness.light
            ? ThemeData.light().textTheme
            : ThemeData.dark().textTheme,
      );

  // ─────────────────────────────────────────────────────────────────────────
  // Light theme  (default — white background)
  // ─────────────────────────────────────────────────────────────────────────
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: brandRed,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: _textTheme(Brightness.light),
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
  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: brandRed,
      brightness: Brightness.dark,
      surface: darkSurface,
    ),
    scaffoldBackgroundColor: darkSurface,
    textTheme: _textTheme(Brightness.dark),
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
