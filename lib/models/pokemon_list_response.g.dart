// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonListResponse _$PokemonListResponseFromJson(Map<String, dynamic> json) =>
    PokemonListResponse(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => PokemonEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonListResponseToJson(
        PokemonListResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

PokemonEntry _$PokemonEntryFromJson(Map<String, dynamic> json) => PokemonEntry(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PokemonEntryToJson(PokemonEntry instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
