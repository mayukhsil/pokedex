import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/core/theme/app_theme.dart';
import 'package:pokedex/providers/pokemon_providers.dart';
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
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'POKÉDEX',
                    style: GoogleFonts.nunito(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: isDark ? Colors.white : AppTheme.darkSurface,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Text(
                      'ALL REGIONS',
                      style: GoogleFonts.nunito(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.brandRed,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
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
                          style: GoogleFonts.nunito(
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
