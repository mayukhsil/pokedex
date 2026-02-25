// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonDetailImpl _$$PokemonDetailImplFromJson(Map<String, dynamic> json) =>
    _$PokemonDetailImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      baseExperience: (json['base_experience'] as num?)?.toInt(),
      types: (json['types'] as List<dynamic>)
          .map((e) => PokemonTypeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => PokemonStatSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => PokemonAbilitySlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      sprites: PokemonSprites.fromJson(json['sprites'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonDetailImplToJson(_$PokemonDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
      'base_experience': instance.baseExperience,
      'types': instance.types,
      'stats': instance.stats,
      'abilities': instance.abilities,
      'sprites': instance.sprites,
    };

_$PokemonTypeSlotImpl _$$PokemonTypeSlotImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonTypeSlotImpl(
      slot: (json['slot'] as num).toInt(),
      type: NamedResource.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonTypeSlotImplToJson(
        _$PokemonTypeSlotImpl instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

_$PokemonStatSlotImpl _$$PokemonStatSlotImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonStatSlotImpl(
      baseStat: (json['base_stat'] as num).toInt(),
      effort: (json['effort'] as num).toInt(),
      stat: NamedResource.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonStatSlotImplToJson(
        _$PokemonStatSlotImpl instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };

_$PokemonAbilitySlotImpl _$$PokemonAbilitySlotImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonAbilitySlotImpl(
      isHidden: json['is_hidden'] as bool,
      slot: (json['slot'] as num).toInt(),
      ability: NamedResource.fromJson(json['ability'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonAbilitySlotImplToJson(
        _$PokemonAbilitySlotImpl instance) =>
    <String, dynamic>{
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
      'ability': instance.ability,
    };

_$PokemonSpritesImpl _$$PokemonSpritesImplFromJson(Map<String, dynamic> json) =>
    _$PokemonSpritesImpl(
      frontDefault: json['front_default'] as String?,
      frontShiny: json['front_shiny'] as String?,
      other:
          PokemonOtherSprites.fromJson(json['other'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonSpritesImplToJson(
        _$PokemonSpritesImpl instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_shiny': instance.frontShiny,
      'other': instance.other,
    };

_$PokemonOtherSpritesImpl _$$PokemonOtherSpritesImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonOtherSpritesImpl(
      officialArtwork: json['official-artwork'] == null
          ? null
          : OfficialArtwork.fromJson(
              json['official-artwork'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonOtherSpritesImplToJson(
        _$PokemonOtherSpritesImpl instance) =>
    <String, dynamic>{
      'official-artwork': instance.officialArtwork,
    };

_$OfficialArtworkImpl _$$OfficialArtworkImplFromJson(
        Map<String, dynamic> json) =>
    _$OfficialArtworkImpl(
      frontDefault: json['front_default'] as String?,
      frontShiny: json['front_shiny'] as String?,
    );

Map<String, dynamic> _$$OfficialArtworkImplToJson(
        _$OfficialArtworkImpl instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_shiny': instance.frontShiny,
    };

_$NamedResourceImpl _$$NamedResourceImplFromJson(Map<String, dynamic> json) =>
    _$NamedResourceImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$NamedResourceImplToJson(_$NamedResourceImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
