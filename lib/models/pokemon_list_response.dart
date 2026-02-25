import 'package:json_annotation/json_annotation.dart';

part 'pokemon_list_response.g.dart';

@JsonSerializable()
class PokemonListResponse {
  final int count;
  final String? next;
  final String? previous;
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

@JsonSerializable()
class PokemonEntry {
  final String name;
  final String url;

  const PokemonEntry({required this.name, required this.url});

  factory PokemonEntry.fromJson(Map<String, dynamic> json) =>
      _$PokemonEntryFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonEntryToJson(this);

  /// Extracts the Pokémon ID from the URL (e.g. ".../pokemon/25/")
  int get id {
    final segments = url.split('/');
    return int.parse(segments[segments.length - 2]);
  }

  String get spriteUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
}
