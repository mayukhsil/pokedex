import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/core/navigator/app_router.dart';
import 'package:pokedex/core/theme/app_theme.dart';
import 'package:pokedex/providers/theme_provider.dart';
import 'package:pokedex/services/hive_service.dart';

/// Entry point.
///
/// Initialises Hive (opens both boxes synchronously) before [runApp] so that
/// [ThemeNotifier.build] can read the theme preference on the very first frame
/// without stalling.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  runApp(const ProviderScope(child: PokedexApp()));
}

/// Root application widget.
///
/// Uses [ConsumerWidget] so it can watch [themeProvider] and pass the current
/// [ThemeMode] to [MaterialApp] reactively — theme changes trigger a rebuild
/// of this widget only, not the entire subtree.
class PokedexApp extends ConsumerWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch means PokedexApp rebuilds when the user toggles the theme.
    final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Pokédex',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      navigatorKey: AppRouter.navigatorKey,
      navigatorObservers: [AppRouter.observer],
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRoutes.home,
    );
  }
}
