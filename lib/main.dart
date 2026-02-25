import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/core/navigator/app_router.dart';
import 'package:pokedex/core/theme/app_theme.dart';
import 'package:pokedex/providers/theme_provider.dart';
import 'package:pokedex/services/hive_service.dart';

/// Entry point.
///
/// Boot order:
/// 1. Flutter binding is initialised.
/// 2. Hive boxes are opened (synchronous from this point on for box reads).
/// 3. `GoogleFonts.config.allowRuntimeFetching` is set to `false` — Nunito is
///    bundled as a Flutter font asset (`fonts/Nunito/NunitoVariable.ttf`), so
///    the app must never fall back to downloading it.
/// 4. App renders. [ThemeNotifier.build] reads the Hive settings box on the
///    first frame — no flicker.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  // Nunito is bundled — disable CDN fetching entirely.
  // Any other google_fonts usage will also be blocked from network, which is
  // the desired behaviour (all fonts should be declared locally).
  GoogleFonts.config.allowRuntimeFetching = false;
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
