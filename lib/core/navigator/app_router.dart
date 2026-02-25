import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_list_response.dart';
import 'package:pokedex/views/home_view/home_view.dart';
import 'package:pokedex/views/pokemon_detail_view/pokemon_detail_page.dart';

/// All named route strings in one place. Import this wherever you need a route
/// constant — never write the raw string in feature code.
abstract final class AppRoutes {
  /// Root home grid (`/`).
  static const String home = '/';

  /// Pokémon detail page. Expects a [PokemonEntry] passed as `arguments`.
  static const String pokemonDetail = '/pokemon/detail';
}

/// Logs navigation events to the debug console. Wired into
/// [MaterialApp.navigatorObservers] via [AppRouter.observer].
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

/// Centralised routing for the entire application.
///
/// All navigation must go through this class — never call [Navigator.push]
/// with a widget directly. Benefits:
/// - Route strings are in one place ([AppRoutes]).
/// - Transitions are defined once and applied consistently.
/// - The [navigatorKey] allows navigation from outside the widget tree
///   (e.g. from a service or notifier).
///
/// **Wiring into [MaterialApp]:**
/// ```dart
/// MaterialApp(
///   navigatorKey:       AppRouter.navigatorKey,
///   navigatorObservers: [AppRouter.observer],
///   onGenerateRoute:    AppRouter.onGenerateRoute,
///   initialRoute:       AppRoutes.home,
/// )
/// ```
///
/// **Navigating from a widget:**
/// ```dart
/// AppRouter.toPokemonDetail(context, entry);
/// ```
abstract final class AppRouter {
  /// Global navigator key — use for navigation outside the widget tree.
  ///
  /// Attach to [MaterialApp.navigatorKey] once; then call:
  /// ```dart
  /// AppRouter.navigatorKey.currentState?.pushNamed(AppRoutes.pokemonDetail, arguments: entry);
  /// ```
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  /// Observer wired into [MaterialApp.navigatorObservers].
  static final NavigatorObserver observer = _AppNavigatorObserver();

  /// Route factory — map every [AppRoutes] constant to a widget + transition.
  ///
  /// Unknown routes render a plain [Scaffold] with an error message rather
  /// than crashing, making debug easier.
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

  // ── Transition builders ───────────────────────────────────────────────────

  /// Simple opacity fade — used for root-level screen transitions.
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

  /// Subtle slide-up combined with fade — used for detail pages.
  ///
  /// The small vertical offset (`Offset(0, 0.08)`) gives depth without the
  /// jarring full-screen slide common in many apps.
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

  // ── Widget-friendly convenience methods ───────────────────────────────────

  /// Pushes [AppRoutes.pokemonDetail] with [entry] as arguments.
  ///
  /// Triggers the [_slide] transition automatically via [onGenerateRoute].
  static Future<void> toPokemonDetail(
    BuildContext context,
    PokemonEntry entry,
  ) => Navigator.of(
    context,
  ).pushNamed(AppRoutes.pokemonDetail, arguments: entry);
}
