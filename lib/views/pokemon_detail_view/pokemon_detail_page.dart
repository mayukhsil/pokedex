import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/core/styles/type_colors.dart';
import 'package:pokedex/core/theme/app_theme.dart';
import 'package:pokedex/models/pokemon_detail.dart';
import 'package:pokedex/models/pokemon_list_response.dart';
import 'package:pokedex/providers/pokemon_providers.dart';

class PokemonDetailPage extends ConsumerWidget {
  final PokemonEntry entry;

  const PokemonDetailPage({super.key, required this.entry});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(pokemonDetailProvider(entry.id.toString()));
    final scheme = Theme.of(context).colorScheme;

    return detailAsync.when(
      loading:
          () => Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(
                    tag: 'pokemon-${entry.id}',
                    child: CachedNetworkImage(
                      imageUrl: entry.spriteUrl,
                      height: 140,
                      width: 140,
                    ),
                  ),
                  const SizedBox(height: 24),
                  CircularProgressIndicator(color: scheme.primary),
                ],
              ),
            ),
          ),
      error:
          (e, _) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text(
                'Failed to load',
                style: GoogleFonts.nunito(
                  color: scheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ),
          ),
      data: (detail) => _DetailBody(entry: entry, detail: detail),
    );
  }
}

class _DetailBody extends StatelessWidget {
  final PokemonEntry entry;
  final PokemonDetail detail;

  const _DetailBody({required this.entry, required this.detail});

  Color get _primaryColor {
    final type = detail.types.firstOrNull?.type.name ?? '';
    return TypeColors.forType(type) ?? AppTheme.cardFallback;
  }

  @override
  Widget build(BuildContext context) {
    final artworkUrl =
        detail.sprites.other.officialArtwork?.frontDefault ?? entry.spriteUrl;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ── Boxy type-coloured header ────────────────────────────────────
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            stretch: false,
            backgroundColor: _primaryColor,
            foregroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(3),
              child: Container(
                height: 3,
                color: Colors.white.withValues(alpha: 0.4),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.fromLTRB(20, 0, 20, 18),
              title: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#${detail.id.toString().padLeft(3, '0')}',
                    style: GoogleFonts.nunito(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Colors.white60,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Text(
                    _capitalize(detail.name).toUpperCase(),
                    style: GoogleFonts.nunito(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              background: Stack(
                children: [
                  // Solid type-color background
                  Container(color: _primaryColor),
                  // Artwork
                  Positioned.fill(
                    child: Align(
                      alignment: const Alignment(0, 0.2),
                      child: Hero(
                        tag: 'pokemon-${entry.id}',
                        child: CachedNetworkImage(
                          imageUrl: artworkUrl,
                          height: 210,
                          width: 210,
                          fit: BoxFit.contain,
                          placeholder:
                              (_, __) => const SizedBox(
                                height: 210,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white54,
                                  ),
                                ),
                              ),
                          errorWidget:
                              (_, __, ___) => const Icon(
                                Icons.catching_pokemon,
                                size: 90,
                                color: Colors.white30,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Body — boxy cards for each section ────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16).copyWith(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Types row
                  Wrap(
                    spacing: 8,
                    children:
                        detail.types
                            .map((t) => _TypeTag(type: t.type.name))
                            .toList(),
                  ),

                  const SizedBox(height: 20),

                  // About row
                  _BoxySection(
                    title: 'ABOUT',
                    accentColor: _primaryColor,
                    child: Row(
                      children: [
                        _StatPill(
                          label: 'Height',
                          value: '${detail.height / 10} m',
                        ),
                        const SizedBox(width: 10),
                        _StatPill(
                          label: 'Weight',
                          value: '${detail.weight / 10} kg',
                        ),
                        if (detail.baseExperience != null) ...[
                          const SizedBox(width: 10),
                          _StatPill(
                            label: 'Base XP',
                            value: '${detail.baseExperience}',
                          ),
                        ],
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Abilities
                  _BoxySection(
                    title: 'ABILITIES',
                    accentColor: _primaryColor,
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children:
                          detail.abilities
                              .map(
                                (a) => _AbilityTag(
                                  name: a.ability.name,
                                  isHidden: a.isHidden,
                                  accentColor: _primaryColor,
                                ),
                              )
                              .toList(),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Base Stats
                  _BoxySection(
                    title: 'BASE STATS',
                    accentColor: _primaryColor,
                    child: Column(
                      children:
                          detail.stats
                              .map(
                                (s) => _StatBar(
                                  statSlot: s,
                                  accentColor: _primaryColor,
                                ),
                              )
                              .toList(),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);
}

// ── Boxy section container ────────────────────────────────────────────────────
class _BoxySection extends StatelessWidget {
  final String title;
  final Color accentColor;
  final Widget child;
  const _BoxySection({
    required this.title,
    required this.accentColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkAppBar : scheme.surface,
        border: Border.all(color: accentColor.withValues(alpha: 0.5), width: 2),
        borderRadius: AppTheme.boxyRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Section header bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
            child: Text(
              title,
              style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.5,
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(14), child: child),
        ],
      ),
    );
  }
}

// ── Type tag ──────────────────────────────────────────────────────────────────
class _TypeTag extends StatelessWidget {
  final String type;
  const _TypeTag({required this.type});

  @override
  Widget build(BuildContext context) {
    final color = TypeColors.forType(type) ?? Colors.grey;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: AppTheme.boxyRadius,
      ),
      child: Text(
        type.toUpperCase(),
        style: GoogleFonts.nunito(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

// ── Stat pill ─────────────────────────────────────────────────────────────────
class _StatPill extends StatelessWidget {
  final String label;
  final String value;
  const _StatPill({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: scheme.surfaceContainerHighest,
          borderRadius: AppTheme.boxyRadius,
          border: Border.all(color: scheme.outlineVariant),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: GoogleFonts.nunito(
                color: scheme.onSurface,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label.toUpperCase(),
              style: GoogleFonts.nunito(
                color: scheme.onSurface.withValues(alpha: 0.45),
                fontSize: 9,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Ability tag ───────────────────────────────────────────────────────────────
class _AbilityTag extends StatelessWidget {
  final String name;
  final bool isHidden;
  final Color accentColor;
  const _AbilityTag({
    required this.name,
    required this.isHidden,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color:
            isHidden
                ? accentColor.withValues(alpha: 0.1)
                : scheme.surfaceContainerHighest,
        borderRadius: AppTheme.boxyRadius,
        border: Border.all(
          color:
              isHidden
                  ? accentColor.withValues(alpha: 0.6)
                  : scheme.outlineVariant,
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isHidden) ...[
            Icon(Icons.visibility_off_rounded, size: 11, color: accentColor),
            const SizedBox(width: 4),
          ],
          Text(
            _fmt(name),
            style: GoogleFonts.nunito(
              color:
                  isHidden
                      ? accentColor
                      : scheme.onSurface.withValues(alpha: 0.85),
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  String _fmt(String s) {
    final words = s
        .split('-')
        .map((w) => w.isEmpty ? w : w[0].toUpperCase() + w.substring(1));
    return words.join(' ');
  }
}

// ── Stat Bar ──────────────────────────────────────────────────────────────────
class _StatBar extends StatelessWidget {
  final PokemonStatSlot statSlot;
  final Color accentColor;
  const _StatBar({required this.statSlot, required this.accentColor});

  static const _labels = {
    'hp': 'HP',
    'attack': 'ATK',
    'defense': 'DEF',
    'special-attack': 'SP.ATK',
    'special-defense': 'SP.DEF',
    'speed': 'SPD',
  };

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final label = _labels[statSlot.stat.name] ?? statSlot.stat.name;
    final value = statSlot.baseStat;
    final fraction = (value / 255).clamp(0.0, 1.0);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 66,
            child: Text(
              label,
              style: GoogleFonts.nunito(
                color: scheme.onSurface.withValues(alpha: 0.45),
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
            ),
          ),
          SizedBox(
            width: 34,
            child: Text(
              '$value',
              style: GoogleFonts.nunito(
                color: scheme.onSurface.withValues(alpha: 0.8),
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: AppTheme.boxyRadius,
              child: LinearProgressIndicator(
                value: fraction,
                backgroundColor: scheme.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation<Color>(
                  _barColor(fraction, accentColor),
                ),
                minHeight: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _barColor(double fraction, Color accent) {
    if (fraction < 0.33) return Colors.redAccent;
    if (fraction < 0.66) return Colors.orangeAccent;
    return Colors.green.shade500;
  }
}
