import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_list_response.dart';
import 'package:pokedex/views/home_view/home_view.dart';
import 'package:pokedex/views/pokemon_detail_view/pokemon_detail_page.dart';

/// Named route constants — single location for every route string.
abstract final class AppRoutes {
  static const String home = '/';
  static const String pokemonDetail = '/pokemon/detail';
}

/// Thin logging observer for navigation events.
class _AppNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('[Router] push → ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('[Router] pop  ← ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    debugPrint(
      '[Router] replace ${oldRoute?.settings.name} → ${newRoute?.settings.name}',
    );
  }
}

abstract final class AppRouter {
  /// Global navigator key — use for navigation outside of a widget tree.
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  /// Observer wired into [MaterialApp.navigatorObservers].
  static final NavigatorObserver observer = _AppNavigatorObserver();

  /// Central route factory.
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return _fade(const HomeView(), settings);

      case AppRoutes.pokemonDetail:
        final entry = settings.arguments as PokemonEntry;
        return _slide(PokemonDetailPage(entry: entry), settings);

      default:
        return _fade(
          Scaffold(
            body: Center(child: Text('Route "${settings.name}" not found')),
          ),
          settings,
        );
    }
  }

  // ── Transition helpers ────────────────────────────────────────────────────

  /// Fade transition — used for root screens.
  static PageRoute<T> _fade<T>(Widget page, RouteSettings settings) =>
      PageRouteBuilder<T>(
        settings: settings,
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder:
            (_, animation, __, child) => FadeTransition(
              opacity: CurvedAnimation(parent: animation, curve: Curves.easeIn),
              child: child,
            ),
        transitionDuration: const Duration(milliseconds: 250),
      );

  /// Slide-up transition — used for detail screens.
  static PageRoute<T> _slide<T>(Widget page, RouteSettings settings) =>
      PageRouteBuilder<T>(
        settings: settings,
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, animation, __, child) {
          final tween = Tween<Offset>(
            begin: const Offset(0, 0.08),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeOutCubic));
          return SlideTransition(
            position: animation.drive(tween),
            child: FadeTransition(
              opacity: CurvedAnimation(parent: animation, curve: Curves.easeIn),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      );

  // ── Convenience methods for use inside widgets ────────────────────────────

  /// Push the Pokémon detail page for [entry].
  static Future<void> toPokemonDetail(
    BuildContext context,
    PokemonEntry entry,
  ) => Navigator.of(
    context,
  ).pushNamed(AppRoutes.pokemonDetail, arguments: entry);
}
