# 🔴 Pokédex

A production-quality Flutter application that consumes the [PokéAPI](https://pokeapi.co/) to browse and explore every Pokémon — built with a strong emphasis on architecture, design systems, and performance.

> Screenshots coming soon.

---

## ✨ Features

- **Infinite-scroll home grid** — paginated list of all Pokémon, auto-fetches on scroll
- **Type-coloured cards** — each card's border, top strip, and badge use the Pokémon's actual element colour, loaded asynchronously and cached
- **Detail view** — official artwork, type chips, base stats, abilities, height/weight
- **Hero transitions** — sprite animates from card → detail header
- **Light & Dark mode** — system-adaptive with white-default light theme
- **Hive offline cache** — zero-latency first paint from cache; fresh data loaded in background
- **Boxy minimalist design language** — flat cards, bold borders, solid type-colours, zero gradients

---

## 🏗️ Architecture

```
lib/
├── core/
│   ├── navigator/      # AppRouter — named routes, custom transitions, NavigatorObserver
│   ├── styles/         # TypeColors — maps 18 Pokémon element types to brand colours
│   └── theme/          # AppTheme — single source of truth for all visual tokens
├── models/             # Freezed + json_serializable data models
│   ├── pokemon_detail.dart
│   └── pokemon_list_response.dart
├── providers/          # Riverpod state layer
│   └── pokemon_providers.dart
├── services/
│   ├── hive_service.dart      # Local cache — read/write/clear
│   └── network_service.dart   # Dio HTTP client
└── views/
    ├── home_view/             # Grid + infinite scroll
    │   └── widgets/
    │       └── pokemon_card.dart
    └── pokemon_detail_view/   # Full detail page
```

### State Management — Riverpod

| Provider | Type | Purpose |
|---|---|---|
| `networkServiceProvider` | `Provider` | Dio HTTP singleton |
| `hiveServiceProvider` | `Provider` | Hive cache singleton |
| `pokemonListProvider` | `AsyncNotifierProvider` | Paginated list, cache-first |
| `pokemonDetailProvider` | `FutureProvider.family` | Per-Pokémon detail, keyed by ID |
| `pokemonTypeColorProvider` | `FutureProvider.family` | Primary type color per ID, reuses detail cache |

### Caching Strategy

```
App launch
 ├─ Hive cache hit?  → Render instantly (no spinner)
 │                      └─ Background network fetch → update state silently
 └─ No cache?        → Network fetch → render → persist to Hive

Scroll to bottom    → Fetch next 20 → append → persist growing list
Pull to refresh     → Full network fetch → overwrite cache
```

### Navigation

All routing is centralised in `AppRouter`:
- **Named routes** — `AppRoutes.home`, `AppRoutes.pokemonDetail`
- **Custom transitions** — Fade for root, slide-up + fade for detail
- **GlobalKey** — available app-wide for navigation outside widget tree
- **`NavigatorObserver`** — logs push/pop/replace events to console

### Design System — `AppTheme`

All visual decisions live in one place:

```dart
AppTheme.brandRed        // #E94560
AppTheme.boxyRadiusPx    // 6.0 — tweak for rounder/squarer corners
AppTheme.cardBorderWidth // 2.5 — card border thickness
AppTheme.light           // Full light ThemeData
AppTheme.dark            // Full dark ThemeData
```

---

## 🧱 Tech Stack

| Layer | Package |
|---|---|
| State management | [`flutter_riverpod`](https://pub.dev/packages/flutter_riverpod) `2.6.1` |
| Networking | [`dio`](https://pub.dev/packages/dio) `5.x` |
| Local cache | [`hive_flutter`](https://pub.dev/packages/hive_flutter) |
| Models | [`freezed`](https://pub.dev/packages/freezed) + [`json_serializable`](https://pub.dev/packages/json_serializable) |
| Image loading | [`cached_network_image`](https://pub.dev/packages/cached_network_image) |
| Typography | [`google_fonts`](https://pub.dev/packages/google_fonts) (Nunito) |

---

## 🚀 Running Locally

```bash
git clone https://github.com/mayukhsil/pokedex.git
cd pokedex

flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

> Requires Flutter SDK `^3.5.0` and Dart SDK `^3.5.0`.

---

## 📡 API

Data sourced from [PokéAPI](https://pokeapi.co/) — free, open, no authentication required.

| Endpoint | Used for |
|---|---|
| `GET /pokemon?limit=20&offset=N` | Paginated list |
| `GET /pokemon/{id}` | Detail — types, stats, abilities, sprites |

Official artwork pulled from the [`PokeAPI/sprites`](https://github.com/PokeAPI/sprites) GitHub CDN.

---

## 📁 Key Files

| File | Purpose |
|---|---|
| [`lib/core/theme/app_theme.dart`](lib/core/theme/app_theme.dart) | Master design system |
| [`lib/core/navigator/app_router.dart`](lib/core/navigator/app_router.dart) | Centralised routing |
| [`lib/providers/pokemon_providers.dart`](lib/providers/pokemon_providers.dart) | All Riverpod providers |
| [`lib/services/hive_service.dart`](lib/services/hive_service.dart) | Offline cache layer |

---

*Built by [Mayukh Sil](https://github.com/mayukhsil)*
