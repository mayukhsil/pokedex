import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokedex/core/navigator/app_router.dart';
import 'package:pokedex/core/theme/app_theme.dart';
import 'package:pokedex/models/pokemon_list_response.dart';
import 'package:pokedex/providers/pokemon_providers.dart';

class PokemonCard extends ConsumerWidget {
  final PokemonEntry entry;

  const PokemonCard({super.key, required this.entry});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = entry.id;
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Try to resolve the type color (loaded async, fallback while loading)
    final typeColorAsync = ref.watch(pokemonTypeColorProvider(id));
    final typeColor = typeColorAsync.valueOrNull ?? AppTheme.cardFallback;

    final cardBg =
        isDark
            ? AppTheme
                .darkAppBar // dark surface
            : scheme.surface; // white in light mode
    final textColor = isDark ? Colors.white : AppTheme.darkSurface;
    final dimTextColor =
        isDark
            ? Colors.white.withValues(alpha: 0.45)
            : AppTheme.darkSurface.withValues(alpha: 0.4);

    return GestureDetector(
      onTap: () => AppRouter.toPokemonDetail(context, entry),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: cardBg,
          border: Border.all(color: typeColor, width: 2.5),
          borderRadius: AppTheme.boxyRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Coloured type-bar strip across the top ──────────────────
            Container(
              height: 5,
              decoration: BoxDecoration(
                color: typeColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppTheme.boxyRadiusPx),
                  topRight: Radius.circular(AppTheme.boxyRadiusPx),
                ),
              ),
            ),

            // ── Content ─────────────────────────────────────────────────
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ID
                    Text(
                      '#${id.toString().padLeft(3, '0')}',
                      style: AppTheme.nunito(
                        color: dimTextColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 1),
                    // Name
                    Text(
                      _capitalize(entry.name),
                      style: AppTheme.nunito(
                        color: textColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.3,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const Spacer(),

                    // Sprite
                    Center(
                      child: Hero(
                        tag: 'pokemon-$id',
                        child: CachedNetworkImage(
                          imageUrl: entry.spriteUrl,
                          height: 88,
                          width: 88,
                          fit: BoxFit.contain,
                          placeholder:
                              (_, __) => SizedBox(
                                height: 88,
                                width: 88,
                                child: Center(
                                  child: SizedBox(
                                    width: 22,
                                    height: 22,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: typeColor.withValues(alpha: 0.6),
                                    ),
                                  ),
                                ),
                              ),
                          errorWidget:
                              (_, __, ___) => Icon(
                                Icons.catching_pokemon,
                                size: 52,
                                color: typeColor.withValues(alpha: 0.4),
                              ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 6),

                    // Type badge pill
                    if (typeColorAsync.hasValue)
                      _TypeBadge(
                        typeName: _resolvedTypeName(ref, id),
                        color: typeColor,
                        isDark: isDark,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _resolvedTypeName(WidgetRef ref, int id) {
    final detail = ref.read(pokemonDetailProvider(id.toString())).valueOrNull;
    return detail?.types.firstOrNull?.type.name ?? '';
  }

  String _capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);
}

class _TypeBadge extends StatelessWidget {
  final String typeName;
  final Color color;
  final bool isDark;
  const _TypeBadge({
    required this.typeName,
    required this.color,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    if (typeName.isEmpty) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: isDark ? 0.20 : 0.14),
        border: Border.all(color: color.withValues(alpha: 0.6), width: 1.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        typeName.toUpperCase(),
        style: AppTheme.nunito(
          color: color,
          fontSize: 9,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.1,
        ),
      ),
    );
  }
}
