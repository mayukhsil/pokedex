import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/core/theme/app_theme.dart';
import 'package:pokedex/providers/pokemon_providers.dart';
import 'package:pokedex/providers/theme_provider.dart';
import 'package:pokedex/views/home_view/widgets/pokemon_card.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      ref.read(pokemonListProvider.notifier).fetchMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final listAsync = ref.watch(pokemonListProvider);
    final notifier = ref.read(pokemonListProvider.notifier);
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // ── Boxy flat AppBar ─────────────────────────────────────────────
          SliverAppBar(
            expandedHeight: 110,
            pinned: true,
            stretch: false,
            backgroundColor: isDark ? AppTheme.darkAppBar : scheme.surface,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(3),
              child: Container(height: 3, color: AppTheme.brandRed),
            ),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.fromLTRB(20, 0, 20, 18),
              title: GestureDetector(
                // Tap → toggle between light and dark
                onTap: () => ref.read(themeProvider.notifier).toggle(),
                // Swipe left → dark, swipe right → light
                onHorizontalDragEnd: (details) {
                  final v = details.primaryVelocity ?? 0;
                  if (v < -200) {
                    ref.read(themeProvider.notifier).setDark();
                  } else if (v > 200) {
                    ref.read(themeProvider.notifier).setLight();
                  }
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        'POKÉDEX',
                        style: AppTheme.nunito(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          color: isDark ? Colors.white : AppTheme.brandRed,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    // Visual hint — sun in light mode, moon in dark
                    Padding(
                      padding: EdgeInsets.only(left: 4, bottom: 6),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder:
                            (child, anim) => RotationTransition(
                              turns: anim,
                              child: FadeTransition(
                                opacity: anim,
                                child: child,
                              ),
                            ),
                        child: Icon(
                          isDark
                              ? Icons.dark_mode_rounded
                              : Icons.light_mode_rounded,
                          key: ValueKey(isDark),
                          color:
                              isDark
                                  ? Colors.white54
                                  : AppTheme.darkSurface.withValues(alpha: 0.4),
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── Grid content ─────────────────────────────────────────────────
          listAsync.when(
            loading:
                () => SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(color: scheme.primary),
                  ),
                ),
            error:
                (e, _) => SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: scheme.error,
                          size: 48,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Something went wrong',
                          style: AppTheme.nunito(
                            color: scheme.onSurface.withValues(alpha: 0.7),
                          ),
                        ),
                        const SizedBox(height: 16),
                        FilledButton.icon(
                          onPressed: () => notifier.refresh(),
                          icon: const Icon(Icons.refresh),
                          label: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                ),
            data:
                (pokemons) => SliverPadding(
                  padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index == pokemons.length) {
                          return notifier.hasMore
                              ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      color: scheme.primary,
                                      strokeWidth: 2.5,
                                    ),
                                  ),
                                ),
                              )
                              : const SizedBox.shrink();
                        }
                        return PokemonCard(entry: pokemons[index]);
                      },
                      childCount: pokemons.length + (notifier.hasMore ? 1 : 0),
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.82,
                        ),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
