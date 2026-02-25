import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_detail.freezed.dart';
part 'pokemon_detail.g.dart';

@freezed
class PokemonDetail with _$PokemonDetail {
  const factory PokemonDetail({
    required int id,
    required String name,
    required int height,
    required int weight,
    int? baseExperience,
    required List<PokemonTypeSlot> types,
    required List<PokemonStatSlot> stats,
    required List<PokemonAbilitySlot> abilities,
    required PokemonSprites sprites,
  }) = _PokemonDetail;

  factory PokemonDetail.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailFromJson(json);
}

@freezed
class PokemonTypeSlot with _$PokemonTypeSlot {
  const factory PokemonTypeSlot({
    required int slot,
    required NamedResource type,
  }) = _PokemonTypeSlot;

  factory PokemonTypeSlot.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeSlotFromJson(json);
}

@freezed
class PokemonStatSlot with _$PokemonStatSlot {
  const factory PokemonStatSlot({
    required int baseStat,
    required int effort,
    required NamedResource stat,
  }) = _PokemonStatSlot;

  factory PokemonStatSlot.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatSlotFromJson(json);
}

@freezed
class PokemonAbilitySlot with _$PokemonAbilitySlot {
  const factory PokemonAbilitySlot({
    required bool isHidden,
    required int slot,
    required NamedResource ability,
  }) = _PokemonAbilitySlot;

  factory PokemonAbilitySlot.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilitySlotFromJson(json);
}

@freezed
class PokemonSprites with _$PokemonSprites {
  const factory PokemonSprites({
    String? frontDefault,
    String? frontShiny,
    required PokemonOtherSprites other,
  }) = _PokemonSprites;

  factory PokemonSprites.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesFromJson(json);
}

@freezed
class PokemonOtherSprites with _$PokemonOtherSprites {
  const factory PokemonOtherSprites({OfficialArtwork? officialArtwork}) =
      _PokemonOtherSprites;

  factory PokemonOtherSprites.fromJson(Map<String, dynamic> json) =>
      _$PokemonOtherSpritesFromJson(json);
}

@freezed
class OfficialArtwork with _$OfficialArtwork {
  const factory OfficialArtwork({String? frontDefault, String? frontShiny}) =
      _OfficialArtwork;

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      _$OfficialArtworkFromJson(json);
}

@freezed
class NamedResource with _$NamedResource {
  const factory NamedResource({required String name, required String url}) =
      _NamedResource;

  factory NamedResource.fromJson(Map<String, dynamic> json) =>
      _$NamedResourceFromJson(json);
}
