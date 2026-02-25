// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemonDetail _$PokemonDetailFromJson(Map<String, dynamic> json) {
  return _PokemonDetail.fromJson(json);
}

/// @nodoc
mixin _$PokemonDetail {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_experience')
  int? get baseExperience => throw _privateConstructorUsedError;
  List<PokemonTypeSlot> get types => throw _privateConstructorUsedError;
  List<PokemonStatSlot> get stats => throw _privateConstructorUsedError;
  List<PokemonAbilitySlot> get abilities => throw _privateConstructorUsedError;
  PokemonSprites get sprites => throw _privateConstructorUsedError;

  /// Serializes this PokemonDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonDetailCopyWith<PokemonDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonDetailCopyWith<$Res> {
  factory $PokemonDetailCopyWith(
          PokemonDetail value, $Res Function(PokemonDetail) then) =
      _$PokemonDetailCopyWithImpl<$Res, PokemonDetail>;
  @useResult
  $Res call(
      {int id,
      String name,
      int height,
      int weight,
      @JsonKey(name: 'base_experience') int? baseExperience,
      List<PokemonTypeSlot> types,
      List<PokemonStatSlot> stats,
      List<PokemonAbilitySlot> abilities,
      PokemonSprites sprites});

  $PokemonSpritesCopyWith<$Res> get sprites;
}

/// @nodoc
class _$PokemonDetailCopyWithImpl<$Res, $Val extends PokemonDetail>
    implements $PokemonDetailCopyWith<$Res> {
  _$PokemonDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? height = null,
    Object? weight = null,
    Object? baseExperience = freezed,
    Object? types = null,
    Object? stats = null,
    Object? abilities = null,
    Object? sprites = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      baseExperience: freezed == baseExperience
          ? _value.baseExperience
          : baseExperience // ignore: cast_nullable_to_non_nullable
              as int?,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<PokemonTypeSlot>,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<PokemonStatSlot>,
      abilities: null == abilities
          ? _value.abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<PokemonAbilitySlot>,
      sprites: null == sprites
          ? _value.sprites
          : sprites // ignore: cast_nullable_to_non_nullable
              as PokemonSprites,
    ) as $Val);
  }

  /// Create a copy of PokemonDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonSpritesCopyWith<$Res> get sprites {
    return $PokemonSpritesCopyWith<$Res>(_value.sprites, (value) {
      return _then(_value.copyWith(sprites: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonDetailImplCopyWith<$Res>
    implements $PokemonDetailCopyWith<$Res> {
  factory _$$PokemonDetailImplCopyWith(
          _$PokemonDetailImpl value, $Res Function(_$PokemonDetailImpl) then) =
      __$$PokemonDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int height,
      int weight,
      @JsonKey(name: 'base_experience') int? baseExperience,
      List<PokemonTypeSlot> types,
      List<PokemonStatSlot> stats,
      List<PokemonAbilitySlot> abilities,
      PokemonSprites sprites});

  @override
  $PokemonSpritesCopyWith<$Res> get sprites;
}

/// @nodoc
class __$$PokemonDetailImplCopyWithImpl<$Res>
    extends _$PokemonDetailCopyWithImpl<$Res, _$PokemonDetailImpl>
    implements _$$PokemonDetailImplCopyWith<$Res> {
  __$$PokemonDetailImplCopyWithImpl(
      _$PokemonDetailImpl _value, $Res Function(_$PokemonDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? height = null,
    Object? weight = null,
    Object? baseExperience = freezed,
    Object? types = null,
    Object? stats = null,
    Object? abilities = null,
    Object? sprites = null,
  }) {
    return _then(_$PokemonDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      baseExperience: freezed == baseExperience
          ? _value.baseExperience
          : baseExperience // ignore: cast_nullable_to_non_nullable
              as int?,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<PokemonTypeSlot>,
      stats: null == stats
          ? _value._stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<PokemonStatSlot>,
      abilities: null == abilities
          ? _value._abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<PokemonAbilitySlot>,
      sprites: null == sprites
          ? _value.sprites
          : sprites // ignore: cast_nullable_to_non_nullable
              as PokemonSprites,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonDetailImpl implements _PokemonDetail {
  const _$PokemonDetailImpl(
      {required this.id,
      required this.name,
      required this.height,
      required this.weight,
      @JsonKey(name: 'base_experience') this.baseExperience,
      required final List<PokemonTypeSlot> types,
      required final List<PokemonStatSlot> stats,
      required final List<PokemonAbilitySlot> abilities,
      required this.sprites})
      : _types = types,
        _stats = stats,
        _abilities = abilities;

  factory _$PokemonDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonDetailImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int height;
  @override
  final int weight;
  @override
  @JsonKey(name: 'base_experience')
  final int? baseExperience;
  final List<PokemonTypeSlot> _types;
  @override
  List<PokemonTypeSlot> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  final List<PokemonStatSlot> _stats;
  @override
  List<PokemonStatSlot> get stats {
    if (_stats is EqualUnmodifiableListView) return _stats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stats);
  }

  final List<PokemonAbilitySlot> _abilities;
  @override
  List<PokemonAbilitySlot> get abilities {
    if (_abilities is EqualUnmodifiableListView) return _abilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_abilities);
  }

  @override
  final PokemonSprites sprites;

  @override
  String toString() {
    return 'PokemonDetail(id: $id, name: $name, height: $height, weight: $weight, baseExperience: $baseExperience, types: $types, stats: $stats, abilities: $abilities, sprites: $sprites)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.baseExperience, baseExperience) ||
                other.baseExperience == baseExperience) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            const DeepCollectionEquality().equals(other._stats, _stats) &&
            const DeepCollectionEquality()
                .equals(other._abilities, _abilities) &&
            (identical(other.sprites, sprites) || other.sprites == sprites));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      height,
      weight,
      baseExperience,
      const DeepCollectionEquality().hash(_types),
      const DeepCollectionEquality().hash(_stats),
      const DeepCollectionEquality().hash(_abilities),
      sprites);

  /// Create a copy of PokemonDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonDetailImplCopyWith<_$PokemonDetailImpl> get copyWith =>
      __$$PokemonDetailImplCopyWithImpl<_$PokemonDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonDetailImplToJson(
      this,
    );
  }
}

abstract class _PokemonDetail implements PokemonDetail {
  const factory _PokemonDetail(
      {required final int id,
      required final String name,
      required final int height,
      required final int weight,
      @JsonKey(name: 'base_experience') final int? baseExperience,
      required final List<PokemonTypeSlot> types,
      required final List<PokemonStatSlot> stats,
      required final List<PokemonAbilitySlot> abilities,
      required final PokemonSprites sprites}) = _$PokemonDetailImpl;

  factory _PokemonDetail.fromJson(Map<String, dynamic> json) =
      _$PokemonDetailImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get height;
  @override
  int get weight;
  @override
  @JsonKey(name: 'base_experience')
  int? get baseExperience;
  @override
  List<PokemonTypeSlot> get types;
  @override
  List<PokemonStatSlot> get stats;
  @override
  List<PokemonAbilitySlot> get abilities;
  @override
  PokemonSprites get sprites;

  /// Create a copy of PokemonDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonDetailImplCopyWith<_$PokemonDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonTypeSlot _$PokemonTypeSlotFromJson(Map<String, dynamic> json) {
  return _PokemonTypeSlot.fromJson(json);
}

/// @nodoc
mixin _$PokemonTypeSlot {
  int get slot => throw _privateConstructorUsedError;
  NamedResource get type => throw _privateConstructorUsedError;

  /// Serializes this PokemonTypeSlot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonTypeSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonTypeSlotCopyWith<PokemonTypeSlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonTypeSlotCopyWith<$Res> {
  factory $PokemonTypeSlotCopyWith(
          PokemonTypeSlot value, $Res Function(PokemonTypeSlot) then) =
      _$PokemonTypeSlotCopyWithImpl<$Res, PokemonTypeSlot>;
  @useResult
  $Res call({int slot, NamedResource type});

  $NamedResourceCopyWith<$Res> get type;
}

/// @nodoc
class _$PokemonTypeSlotCopyWithImpl<$Res, $Val extends PokemonTypeSlot>
    implements $PokemonTypeSlotCopyWith<$Res> {
  _$PokemonTypeSlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonTypeSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slot = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NamedResource,
    ) as $Val);
  }

  /// Create a copy of PokemonTypeSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NamedResourceCopyWith<$Res> get type {
    return $NamedResourceCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonTypeSlotImplCopyWith<$Res>
    implements $PokemonTypeSlotCopyWith<$Res> {
  factory _$$PokemonTypeSlotImplCopyWith(_$PokemonTypeSlotImpl value,
          $Res Function(_$PokemonTypeSlotImpl) then) =
      __$$PokemonTypeSlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int slot, NamedResource type});

  @override
  $NamedResourceCopyWith<$Res> get type;
}

/// @nodoc
class __$$PokemonTypeSlotImplCopyWithImpl<$Res>
    extends _$PokemonTypeSlotCopyWithImpl<$Res, _$PokemonTypeSlotImpl>
    implements _$$PokemonTypeSlotImplCopyWith<$Res> {
  __$$PokemonTypeSlotImplCopyWithImpl(
      _$PokemonTypeSlotImpl _value, $Res Function(_$PokemonTypeSlotImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonTypeSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slot = null,
    Object? type = null,
  }) {
    return _then(_$PokemonTypeSlotImpl(
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NamedResource,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonTypeSlotImpl implements _PokemonTypeSlot {
  const _$PokemonTypeSlotImpl({required this.slot, required this.type});

  factory _$PokemonTypeSlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonTypeSlotImplFromJson(json);

  @override
  final int slot;
  @override
  final NamedResource type;

  @override
  String toString() {
    return 'PokemonTypeSlot(slot: $slot, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonTypeSlotImpl &&
            (identical(other.slot, slot) || other.slot == slot) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, slot, type);

  /// Create a copy of PokemonTypeSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonTypeSlotImplCopyWith<_$PokemonTypeSlotImpl> get copyWith =>
      __$$PokemonTypeSlotImplCopyWithImpl<_$PokemonTypeSlotImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonTypeSlotImplToJson(
      this,
    );
  }
}

abstract class _PokemonTypeSlot implements PokemonTypeSlot {
  const factory _PokemonTypeSlot(
      {required final int slot,
      required final NamedResource type}) = _$PokemonTypeSlotImpl;

  factory _PokemonTypeSlot.fromJson(Map<String, dynamic> json) =
      _$PokemonTypeSlotImpl.fromJson;

  @override
  int get slot;
  @override
  NamedResource get type;

  /// Create a copy of PokemonTypeSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonTypeSlotImplCopyWith<_$PokemonTypeSlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonStatSlot _$PokemonStatSlotFromJson(Map<String, dynamic> json) {
  return _PokemonStatSlot.fromJson(json);
}

/// @nodoc
mixin _$PokemonStatSlot {
  @JsonKey(name: 'base_stat')
  int get baseStat => throw _privateConstructorUsedError;
  int get effort => throw _privateConstructorUsedError;
  NamedResource get stat => throw _privateConstructorUsedError;

  /// Serializes this PokemonStatSlot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonStatSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonStatSlotCopyWith<PokemonStatSlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonStatSlotCopyWith<$Res> {
  factory $PokemonStatSlotCopyWith(
          PokemonStatSlot value, $Res Function(PokemonStatSlot) then) =
      _$PokemonStatSlotCopyWithImpl<$Res, PokemonStatSlot>;
  @useResult
  $Res call(
      {@JsonKey(name: 'base_stat') int baseStat,
      int effort,
      NamedResource stat});

  $NamedResourceCopyWith<$Res> get stat;
}

/// @nodoc
class _$PokemonStatSlotCopyWithImpl<$Res, $Val extends PokemonStatSlot>
    implements $PokemonStatSlotCopyWith<$Res> {
  _$PokemonStatSlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonStatSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseStat = null,
    Object? effort = null,
    Object? stat = null,
  }) {
    return _then(_value.copyWith(
      baseStat: null == baseStat
          ? _value.baseStat
          : baseStat // ignore: cast_nullable_to_non_nullable
              as int,
      effort: null == effort
          ? _value.effort
          : effort // ignore: cast_nullable_to_non_nullable
              as int,
      stat: null == stat
          ? _value.stat
          : stat // ignore: cast_nullable_to_non_nullable
              as NamedResource,
    ) as $Val);
  }

  /// Create a copy of PokemonStatSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NamedResourceCopyWith<$Res> get stat {
    return $NamedResourceCopyWith<$Res>(_value.stat, (value) {
      return _then(_value.copyWith(stat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonStatSlotImplCopyWith<$Res>
    implements $PokemonStatSlotCopyWith<$Res> {
  factory _$$PokemonStatSlotImplCopyWith(_$PokemonStatSlotImpl value,
          $Res Function(_$PokemonStatSlotImpl) then) =
      __$$PokemonStatSlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'base_stat') int baseStat,
      int effort,
      NamedResource stat});

  @override
  $NamedResourceCopyWith<$Res> get stat;
}

/// @nodoc
class __$$PokemonStatSlotImplCopyWithImpl<$Res>
    extends _$PokemonStatSlotCopyWithImpl<$Res, _$PokemonStatSlotImpl>
    implements _$$PokemonStatSlotImplCopyWith<$Res> {
  __$$PokemonStatSlotImplCopyWithImpl(
      _$PokemonStatSlotImpl _value, $Res Function(_$PokemonStatSlotImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonStatSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseStat = null,
    Object? effort = null,
    Object? stat = null,
  }) {
    return _then(_$PokemonStatSlotImpl(
      baseStat: null == baseStat
          ? _value.baseStat
          : baseStat // ignore: cast_nullable_to_non_nullable
              as int,
      effort: null == effort
          ? _value.effort
          : effort // ignore: cast_nullable_to_non_nullable
              as int,
      stat: null == stat
          ? _value.stat
          : stat // ignore: cast_nullable_to_non_nullable
              as NamedResource,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonStatSlotImpl implements _PokemonStatSlot {
  const _$PokemonStatSlotImpl(
      {@JsonKey(name: 'base_stat') required this.baseStat,
      required this.effort,
      required this.stat});

  factory _$PokemonStatSlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonStatSlotImplFromJson(json);

  @override
  @JsonKey(name: 'base_stat')
  final int baseStat;
  @override
  final int effort;
  @override
  final NamedResource stat;

  @override
  String toString() {
    return 'PokemonStatSlot(baseStat: $baseStat, effort: $effort, stat: $stat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonStatSlotImpl &&
            (identical(other.baseStat, baseStat) ||
                other.baseStat == baseStat) &&
            (identical(other.effort, effort) || other.effort == effort) &&
            (identical(other.stat, stat) || other.stat == stat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, baseStat, effort, stat);

  /// Create a copy of PokemonStatSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonStatSlotImplCopyWith<_$PokemonStatSlotImpl> get copyWith =>
      __$$PokemonStatSlotImplCopyWithImpl<_$PokemonStatSlotImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonStatSlotImplToJson(
      this,
    );
  }
}

abstract class _PokemonStatSlot implements PokemonStatSlot {
  const factory _PokemonStatSlot(
      {@JsonKey(name: 'base_stat') required final int baseStat,
      required final int effort,
      required final NamedResource stat}) = _$PokemonStatSlotImpl;

  factory _PokemonStatSlot.fromJson(Map<String, dynamic> json) =
      _$PokemonStatSlotImpl.fromJson;

  @override
  @JsonKey(name: 'base_stat')
  int get baseStat;
  @override
  int get effort;
  @override
  NamedResource get stat;

  /// Create a copy of PokemonStatSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonStatSlotImplCopyWith<_$PokemonStatSlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonAbilitySlot _$PokemonAbilitySlotFromJson(Map<String, dynamic> json) {
  return _PokemonAbilitySlot.fromJson(json);
}

/// @nodoc
mixin _$PokemonAbilitySlot {
  @JsonKey(name: 'is_hidden')
  bool get isHidden => throw _privateConstructorUsedError;
  int get slot => throw _privateConstructorUsedError;
  NamedResource get ability => throw _privateConstructorUsedError;

  /// Serializes this PokemonAbilitySlot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonAbilitySlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonAbilitySlotCopyWith<PokemonAbilitySlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonAbilitySlotCopyWith<$Res> {
  factory $PokemonAbilitySlotCopyWith(
          PokemonAbilitySlot value, $Res Function(PokemonAbilitySlot) then) =
      _$PokemonAbilitySlotCopyWithImpl<$Res, PokemonAbilitySlot>;
  @useResult
  $Res call(
      {@JsonKey(name: 'is_hidden') bool isHidden,
      int slot,
      NamedResource ability});

  $NamedResourceCopyWith<$Res> get ability;
}

/// @nodoc
class _$PokemonAbilitySlotCopyWithImpl<$Res, $Val extends PokemonAbilitySlot>
    implements $PokemonAbilitySlotCopyWith<$Res> {
  _$PokemonAbilitySlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonAbilitySlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isHidden = null,
    Object? slot = null,
    Object? ability = null,
  }) {
    return _then(_value.copyWith(
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      ability: null == ability
          ? _value.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as NamedResource,
    ) as $Val);
  }

  /// Create a copy of PokemonAbilitySlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NamedResourceCopyWith<$Res> get ability {
    return $NamedResourceCopyWith<$Res>(_value.ability, (value) {
      return _then(_value.copyWith(ability: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonAbilitySlotImplCopyWith<$Res>
    implements $PokemonAbilitySlotCopyWith<$Res> {
  factory _$$PokemonAbilitySlotImplCopyWith(_$PokemonAbilitySlotImpl value,
          $Res Function(_$PokemonAbilitySlotImpl) then) =
      __$$PokemonAbilitySlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'is_hidden') bool isHidden,
      int slot,
      NamedResource ability});

  @override
  $NamedResourceCopyWith<$Res> get ability;
}

/// @nodoc
class __$$PokemonAbilitySlotImplCopyWithImpl<$Res>
    extends _$PokemonAbilitySlotCopyWithImpl<$Res, _$PokemonAbilitySlotImpl>
    implements _$$PokemonAbilitySlotImplCopyWith<$Res> {
  __$$PokemonAbilitySlotImplCopyWithImpl(_$PokemonAbilitySlotImpl _value,
      $Res Function(_$PokemonAbilitySlotImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonAbilitySlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isHidden = null,
    Object? slot = null,
    Object? ability = null,
  }) {
    return _then(_$PokemonAbilitySlotImpl(
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      ability: null == ability
          ? _value.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as NamedResource,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonAbilitySlotImpl implements _PokemonAbilitySlot {
  const _$PokemonAbilitySlotImpl(
      {@JsonKey(name: 'is_hidden') required this.isHidden,
      required this.slot,
      required this.ability});

  factory _$PokemonAbilitySlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonAbilitySlotImplFromJson(json);

  @override
  @JsonKey(name: 'is_hidden')
  final bool isHidden;
  @override
  final int slot;
  @override
  final NamedResource ability;

  @override
  String toString() {
    return 'PokemonAbilitySlot(isHidden: $isHidden, slot: $slot, ability: $ability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonAbilitySlotImpl &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden) &&
            (identical(other.slot, slot) || other.slot == slot) &&
            (identical(other.ability, ability) || other.ability == ability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isHidden, slot, ability);

  /// Create a copy of PokemonAbilitySlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonAbilitySlotImplCopyWith<_$PokemonAbilitySlotImpl> get copyWith =>
      __$$PokemonAbilitySlotImplCopyWithImpl<_$PokemonAbilitySlotImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonAbilitySlotImplToJson(
      this,
    );
  }
}

abstract class _PokemonAbilitySlot implements PokemonAbilitySlot {
  const factory _PokemonAbilitySlot(
      {@JsonKey(name: 'is_hidden') required final bool isHidden,
      required final int slot,
      required final NamedResource ability}) = _$PokemonAbilitySlotImpl;

  factory _PokemonAbilitySlot.fromJson(Map<String, dynamic> json) =
      _$PokemonAbilitySlotImpl.fromJson;

  @override
  @JsonKey(name: 'is_hidden')
  bool get isHidden;
  @override
  int get slot;
  @override
  NamedResource get ability;

  /// Create a copy of PokemonAbilitySlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonAbilitySlotImplCopyWith<_$PokemonAbilitySlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonSprites _$PokemonSpritesFromJson(Map<String, dynamic> json) {
  return _PokemonSprites.fromJson(json);
}

/// @nodoc
mixin _$PokemonSprites {
  @JsonKey(name: 'front_default')
  String? get frontDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'front_shiny')
  String? get frontShiny => throw _privateConstructorUsedError;
  PokemonOtherSprites get other => throw _privateConstructorUsedError;

  /// Serializes this PokemonSprites to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonSprites
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonSpritesCopyWith<PokemonSprites> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonSpritesCopyWith<$Res> {
  factory $PokemonSpritesCopyWith(
          PokemonSprites value, $Res Function(PokemonSprites) then) =
      _$PokemonSpritesCopyWithImpl<$Res, PokemonSprites>;
  @useResult
  $Res call(
      {@JsonKey(name: 'front_default') String? frontDefault,
      @JsonKey(name: 'front_shiny') String? frontShiny,
      PokemonOtherSprites other});

  $PokemonOtherSpritesCopyWith<$Res> get other;
}

/// @nodoc
class _$PokemonSpritesCopyWithImpl<$Res, $Val extends PokemonSprites>
    implements $PokemonSpritesCopyWith<$Res> {
  _$PokemonSpritesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonSprites
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontDefault = freezed,
    Object? frontShiny = freezed,
    Object? other = null,
  }) {
    return _then(_value.copyWith(
      frontDefault: freezed == frontDefault
          ? _value.frontDefault
          : frontDefault // ignore: cast_nullable_to_non_nullable
              as String?,
      frontShiny: freezed == frontShiny
          ? _value.frontShiny
          : frontShiny // ignore: cast_nullable_to_non_nullable
              as String?,
      other: null == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as PokemonOtherSprites,
    ) as $Val);
  }

  /// Create a copy of PokemonSprites
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonOtherSpritesCopyWith<$Res> get other {
    return $PokemonOtherSpritesCopyWith<$Res>(_value.other, (value) {
      return _then(_value.copyWith(other: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonSpritesImplCopyWith<$Res>
    implements $PokemonSpritesCopyWith<$Res> {
  factory _$$PokemonSpritesImplCopyWith(_$PokemonSpritesImpl value,
          $Res Function(_$PokemonSpritesImpl) then) =
      __$$PokemonSpritesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'front_default') String? frontDefault,
      @JsonKey(name: 'front_shiny') String? frontShiny,
      PokemonOtherSprites other});

  @override
  $PokemonOtherSpritesCopyWith<$Res> get other;
}

/// @nodoc
class __$$PokemonSpritesImplCopyWithImpl<$Res>
    extends _$PokemonSpritesCopyWithImpl<$Res, _$PokemonSpritesImpl>
    implements _$$PokemonSpritesImplCopyWith<$Res> {
  __$$PokemonSpritesImplCopyWithImpl(
      _$PokemonSpritesImpl _value, $Res Function(_$PokemonSpritesImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonSprites
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontDefault = freezed,
    Object? frontShiny = freezed,
    Object? other = null,
  }) {
    return _then(_$PokemonSpritesImpl(
      frontDefault: freezed == frontDefault
          ? _value.frontDefault
          : frontDefault // ignore: cast_nullable_to_non_nullable
              as String?,
      frontShiny: freezed == frontShiny
          ? _value.frontShiny
          : frontShiny // ignore: cast_nullable_to_non_nullable
              as String?,
      other: null == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as PokemonOtherSprites,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonSpritesImpl implements _PokemonSprites {
  const _$PokemonSpritesImpl(
      {@JsonKey(name: 'front_default') this.frontDefault,
      @JsonKey(name: 'front_shiny') this.frontShiny,
      required this.other});

  factory _$PokemonSpritesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonSpritesImplFromJson(json);

  @override
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @override
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @override
  final PokemonOtherSprites other;

  @override
  String toString() {
    return 'PokemonSprites(frontDefault: $frontDefault, frontShiny: $frontShiny, other: $other)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonSpritesImpl &&
            (identical(other.frontDefault, frontDefault) ||
                other.frontDefault == frontDefault) &&
            (identical(other.frontShiny, frontShiny) ||
                other.frontShiny == frontShiny) &&
            (identical(other.other, this.other) || other.other == this.other));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, frontDefault, frontShiny, other);

  /// Create a copy of PokemonSprites
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonSpritesImplCopyWith<_$PokemonSpritesImpl> get copyWith =>
      __$$PokemonSpritesImplCopyWithImpl<_$PokemonSpritesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonSpritesImplToJson(
      this,
    );
  }
}

abstract class _PokemonSprites implements PokemonSprites {
  const factory _PokemonSprites(
      {@JsonKey(name: 'front_default') final String? frontDefault,
      @JsonKey(name: 'front_shiny') final String? frontShiny,
      required final PokemonOtherSprites other}) = _$PokemonSpritesImpl;

  factory _PokemonSprites.fromJson(Map<String, dynamic> json) =
      _$PokemonSpritesImpl.fromJson;

  @override
  @JsonKey(name: 'front_default')
  String? get frontDefault;
  @override
  @JsonKey(name: 'front_shiny')
  String? get frontShiny;
  @override
  PokemonOtherSprites get other;

  /// Create a copy of PokemonSprites
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonSpritesImplCopyWith<_$PokemonSpritesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonOtherSprites _$PokemonOtherSpritesFromJson(Map<String, dynamic> json) {
  return _PokemonOtherSprites.fromJson(json);
}

/// @nodoc
mixin _$PokemonOtherSprites {
  @JsonKey(name: 'official-artwork')
  OfficialArtwork? get officialArtwork => throw _privateConstructorUsedError;

  /// Serializes this PokemonOtherSprites to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonOtherSprites
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonOtherSpritesCopyWith<PokemonOtherSprites> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonOtherSpritesCopyWith<$Res> {
  factory $PokemonOtherSpritesCopyWith(
          PokemonOtherSprites value, $Res Function(PokemonOtherSprites) then) =
      _$PokemonOtherSpritesCopyWithImpl<$Res, PokemonOtherSprites>;
  @useResult
  $Res call(
      {@JsonKey(name: 'official-artwork') OfficialArtwork? officialArtwork});

  $OfficialArtworkCopyWith<$Res>? get officialArtwork;
}

/// @nodoc
class _$PokemonOtherSpritesCopyWithImpl<$Res, $Val extends PokemonOtherSprites>
    implements $PokemonOtherSpritesCopyWith<$Res> {
  _$PokemonOtherSpritesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonOtherSprites
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? officialArtwork = freezed,
  }) {
    return _then(_value.copyWith(
      officialArtwork: freezed == officialArtwork
          ? _value.officialArtwork
          : officialArtwork // ignore: cast_nullable_to_non_nullable
              as OfficialArtwork?,
    ) as $Val);
  }

  /// Create a copy of PokemonOtherSprites
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OfficialArtworkCopyWith<$Res>? get officialArtwork {
    if (_value.officialArtwork == null) {
      return null;
    }

    return $OfficialArtworkCopyWith<$Res>(_value.officialArtwork!, (value) {
      return _then(_value.copyWith(officialArtwork: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonOtherSpritesImplCopyWith<$Res>
    implements $PokemonOtherSpritesCopyWith<$Res> {
  factory _$$PokemonOtherSpritesImplCopyWith(_$PokemonOtherSpritesImpl value,
          $Res Function(_$PokemonOtherSpritesImpl) then) =
      __$$PokemonOtherSpritesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'official-artwork') OfficialArtwork? officialArtwork});

  @override
  $OfficialArtworkCopyWith<$Res>? get officialArtwork;
}

/// @nodoc
class __$$PokemonOtherSpritesImplCopyWithImpl<$Res>
    extends _$PokemonOtherSpritesCopyWithImpl<$Res, _$PokemonOtherSpritesImpl>
    implements _$$PokemonOtherSpritesImplCopyWith<$Res> {
  __$$PokemonOtherSpritesImplCopyWithImpl(_$PokemonOtherSpritesImpl _value,
      $Res Function(_$PokemonOtherSpritesImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonOtherSprites
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? officialArtwork = freezed,
  }) {
    return _then(_$PokemonOtherSpritesImpl(
      officialArtwork: freezed == officialArtwork
          ? _value.officialArtwork
          : officialArtwork // ignore: cast_nullable_to_non_nullable
              as OfficialArtwork?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonOtherSpritesImpl implements _PokemonOtherSprites {
  const _$PokemonOtherSpritesImpl(
      {@JsonKey(name: 'official-artwork') this.officialArtwork});

  factory _$PokemonOtherSpritesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonOtherSpritesImplFromJson(json);

  @override
  @JsonKey(name: 'official-artwork')
  final OfficialArtwork? officialArtwork;

  @override
  String toString() {
    return 'PokemonOtherSprites(officialArtwork: $officialArtwork)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonOtherSpritesImpl &&
            (identical(other.officialArtwork, officialArtwork) ||
                other.officialArtwork == officialArtwork));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, officialArtwork);

  /// Create a copy of PokemonOtherSprites
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonOtherSpritesImplCopyWith<_$PokemonOtherSpritesImpl> get copyWith =>
      __$$PokemonOtherSpritesImplCopyWithImpl<_$PokemonOtherSpritesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonOtherSpritesImplToJson(
      this,
    );
  }
}

abstract class _PokemonOtherSprites implements PokemonOtherSprites {
  const factory _PokemonOtherSprites(
      {@JsonKey(name: 'official-artwork')
      final OfficialArtwork? officialArtwork}) = _$PokemonOtherSpritesImpl;

  factory _PokemonOtherSprites.fromJson(Map<String, dynamic> json) =
      _$PokemonOtherSpritesImpl.fromJson;

  @override
  @JsonKey(name: 'official-artwork')
  OfficialArtwork? get officialArtwork;

  /// Create a copy of PokemonOtherSprites
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonOtherSpritesImplCopyWith<_$PokemonOtherSpritesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OfficialArtwork _$OfficialArtworkFromJson(Map<String, dynamic> json) {
  return _OfficialArtwork.fromJson(json);
}

/// @nodoc
mixin _$OfficialArtwork {
  @JsonKey(name: 'front_default')
  String? get frontDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'front_shiny')
  String? get frontShiny => throw _privateConstructorUsedError;

  /// Serializes this OfficialArtwork to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OfficialArtwork
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfficialArtworkCopyWith<OfficialArtwork> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfficialArtworkCopyWith<$Res> {
  factory $OfficialArtworkCopyWith(
          OfficialArtwork value, $Res Function(OfficialArtwork) then) =
      _$OfficialArtworkCopyWithImpl<$Res, OfficialArtwork>;
  @useResult
  $Res call(
      {@JsonKey(name: 'front_default') String? frontDefault,
      @JsonKey(name: 'front_shiny') String? frontShiny});
}

/// @nodoc
class _$OfficialArtworkCopyWithImpl<$Res, $Val extends OfficialArtwork>
    implements $OfficialArtworkCopyWith<$Res> {
  _$OfficialArtworkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OfficialArtwork
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontDefault = freezed,
    Object? frontShiny = freezed,
  }) {
    return _then(_value.copyWith(
      frontDefault: freezed == frontDefault
          ? _value.frontDefault
          : frontDefault // ignore: cast_nullable_to_non_nullable
              as String?,
      frontShiny: freezed == frontShiny
          ? _value.frontShiny
          : frontShiny // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfficialArtworkImplCopyWith<$Res>
    implements $OfficialArtworkCopyWith<$Res> {
  factory _$$OfficialArtworkImplCopyWith(_$OfficialArtworkImpl value,
          $Res Function(_$OfficialArtworkImpl) then) =
      __$$OfficialArtworkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'front_default') String? frontDefault,
      @JsonKey(name: 'front_shiny') String? frontShiny});
}

/// @nodoc
class __$$OfficialArtworkImplCopyWithImpl<$Res>
    extends _$OfficialArtworkCopyWithImpl<$Res, _$OfficialArtworkImpl>
    implements _$$OfficialArtworkImplCopyWith<$Res> {
  __$$OfficialArtworkImplCopyWithImpl(
      _$OfficialArtworkImpl _value, $Res Function(_$OfficialArtworkImpl) _then)
      : super(_value, _then);

  /// Create a copy of OfficialArtwork
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontDefault = freezed,
    Object? frontShiny = freezed,
  }) {
    return _then(_$OfficialArtworkImpl(
      frontDefault: freezed == frontDefault
          ? _value.frontDefault
          : frontDefault // ignore: cast_nullable_to_non_nullable
              as String?,
      frontShiny: freezed == frontShiny
          ? _value.frontShiny
          : frontShiny // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfficialArtworkImpl implements _OfficialArtwork {
  const _$OfficialArtworkImpl(
      {@JsonKey(name: 'front_default') this.frontDefault,
      @JsonKey(name: 'front_shiny') this.frontShiny});

  factory _$OfficialArtworkImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfficialArtworkImplFromJson(json);

  @override
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @override
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;

  @override
  String toString() {
    return 'OfficialArtwork(frontDefault: $frontDefault, frontShiny: $frontShiny)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfficialArtworkImpl &&
            (identical(other.frontDefault, frontDefault) ||
                other.frontDefault == frontDefault) &&
            (identical(other.frontShiny, frontShiny) ||
                other.frontShiny == frontShiny));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, frontDefault, frontShiny);

  /// Create a copy of OfficialArtwork
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfficialArtworkImplCopyWith<_$OfficialArtworkImpl> get copyWith =>
      __$$OfficialArtworkImplCopyWithImpl<_$OfficialArtworkImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfficialArtworkImplToJson(
      this,
    );
  }
}

abstract class _OfficialArtwork implements OfficialArtwork {
  const factory _OfficialArtwork(
          {@JsonKey(name: 'front_default') final String? frontDefault,
          @JsonKey(name: 'front_shiny') final String? frontShiny}) =
      _$OfficialArtworkImpl;

  factory _OfficialArtwork.fromJson(Map<String, dynamic> json) =
      _$OfficialArtworkImpl.fromJson;

  @override
  @JsonKey(name: 'front_default')
  String? get frontDefault;
  @override
  @JsonKey(name: 'front_shiny')
  String? get frontShiny;

  /// Create a copy of OfficialArtwork
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfficialArtworkImplCopyWith<_$OfficialArtworkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NamedResource _$NamedResourceFromJson(Map<String, dynamic> json) {
  return _NamedResource.fromJson(json);
}

/// @nodoc
mixin _$NamedResource {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this NamedResource to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NamedResource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NamedResourceCopyWith<NamedResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NamedResourceCopyWith<$Res> {
  factory $NamedResourceCopyWith(
          NamedResource value, $Res Function(NamedResource) then) =
      _$NamedResourceCopyWithImpl<$Res, NamedResource>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$NamedResourceCopyWithImpl<$Res, $Val extends NamedResource>
    implements $NamedResourceCopyWith<$Res> {
  _$NamedResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NamedResource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NamedResourceImplCopyWith<$Res>
    implements $NamedResourceCopyWith<$Res> {
  factory _$$NamedResourceImplCopyWith(
          _$NamedResourceImpl value, $Res Function(_$NamedResourceImpl) then) =
      __$$NamedResourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$NamedResourceImplCopyWithImpl<$Res>
    extends _$NamedResourceCopyWithImpl<$Res, _$NamedResourceImpl>
    implements _$$NamedResourceImplCopyWith<$Res> {
  __$$NamedResourceImplCopyWithImpl(
      _$NamedResourceImpl _value, $Res Function(_$NamedResourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of NamedResource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$NamedResourceImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NamedResourceImpl implements _NamedResource {
  const _$NamedResourceImpl({required this.name, required this.url});

  factory _$NamedResourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$NamedResourceImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'NamedResource(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NamedResourceImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of NamedResource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NamedResourceImplCopyWith<_$NamedResourceImpl> get copyWith =>
      __$$NamedResourceImplCopyWithImpl<_$NamedResourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NamedResourceImplToJson(
      this,
    );
  }
}

abstract class _NamedResource implements NamedResource {
  const factory _NamedResource(
      {required final String name,
      required final String url}) = _$NamedResourceImpl;

  factory _NamedResource.fromJson(Map<String, dynamic> json) =
      _$NamedResourceImpl.fromJson;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of NamedResource
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NamedResourceImplCopyWith<_$NamedResourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
