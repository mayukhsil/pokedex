import 'package:json_annotation/json_annotation.dart';

part 'pokemon_list_response.g.dart';

/// Top-level response from `GET /pokemon?limit=N&offset=M`.
///
/// Mirrors the PokéAPI paginated list envelope:
/// ```json
/// { "count": 1302, "next": "...", "previous": null, "results": [...] }
/// ```
@JsonSerializable()
class PokemonListResponse {
  /// Total number of Pokémon in the database (across all pages).
  final int count;

  /// URL for the next page, or `null` when on the last page.
  final String? next;

  /// URL for the previous page, or `null` on the first page.
  final String? previous;

  /// The Pokémon entries on this page (max 20 per page by default).
  final List<PokemonEntry> results;

  const PokemonListResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonListResponseToJson(this);
}

/// Lightweight Pokémon reference returned by the list endpoint.
///
/// Contains only [name] and [url]; use [id] and [spriteUrl] to avoid
/// re-parsing the same URL string repeatedly.
@JsonSerializable()
class PokemonEntry {
  /// Lowercase Pokémon name as returned by the API (e.g. `"bulbasaur"`).
  final String name;

  /// Canonical API URL, e.g. `"https://pokeapi.co/api/v2/pokemon/1/"`.
  final String url;

  const PokemonEntry({required this.name, required this.url});

  factory PokemonEntry.fromJson(Map<String, dynamic> json) =>
      _$PokemonEntryFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonEntryToJson(this);

  /// Numeric Pokémon ID, extracted from the trailing segment of [url].
  ///
  /// Example: `"https://pokeapi.co/api/v2/pokemon/25/"` → `25`.
  int get id {
    final segments = url.split('/');
    return int.parse(segments[segments.length - 2]);
  }

  /// Direct URL to the official artwork PNG from the PokeAPI/sprites CDN.
  ///
  /// Uses the high-res official artwork variant (not the pixelated game sprite).
  String get spriteUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
}
