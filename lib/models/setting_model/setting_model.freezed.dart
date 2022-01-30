// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'setting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingModel _$SettingModelFromJson(Map<String, dynamic> json) {
  return _SettingModel.fromJson(json);
}

/// @nodoc
class _$SettingModelTearOff {
  const _$SettingModelTearOff();

  _SettingModel call(
      {@HiveField(0) bool? dark = false,
      @HiveField(1) bool? isSecure = false}) {
    return _SettingModel(
      dark: dark,
      isSecure: isSecure,
    );
  }

  SettingModel fromJson(Map<String, Object?> json) {
    return SettingModel.fromJson(json);
  }
}

/// @nodoc
const $SettingModel = _$SettingModelTearOff();

/// @nodoc
mixin _$SettingModel {
  @HiveField(0)
  bool? get dark => throw _privateConstructorUsedError;
  @HiveField(1)
  bool? get isSecure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingModelCopyWith<SettingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingModelCopyWith<$Res> {
  factory $SettingModelCopyWith(
          SettingModel value, $Res Function(SettingModel) then) =
      _$SettingModelCopyWithImpl<$Res>;
  $Res call({@HiveField(0) bool? dark, @HiveField(1) bool? isSecure});
}

/// @nodoc
class _$SettingModelCopyWithImpl<$Res> implements $SettingModelCopyWith<$Res> {
  _$SettingModelCopyWithImpl(this._value, this._then);

  final SettingModel _value;
  // ignore: unused_field
  final $Res Function(SettingModel) _then;

  @override
  $Res call({
    Object? dark = freezed,
    Object? isSecure = freezed,
  }) {
    return _then(_value.copyWith(
      dark: dark == freezed
          ? _value.dark
          : dark // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSecure: isSecure == freezed
          ? _value.isSecure
          : isSecure // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$SettingModelCopyWith<$Res>
    implements $SettingModelCopyWith<$Res> {
  factory _$SettingModelCopyWith(
          _SettingModel value, $Res Function(_SettingModel) then) =
      __$SettingModelCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) bool? dark, @HiveField(1) bool? isSecure});
}

/// @nodoc
class __$SettingModelCopyWithImpl<$Res> extends _$SettingModelCopyWithImpl<$Res>
    implements _$SettingModelCopyWith<$Res> {
  __$SettingModelCopyWithImpl(
      _SettingModel _value, $Res Function(_SettingModel) _then)
      : super(_value, (v) => _then(v as _SettingModel));

  @override
  _SettingModel get _value => super._value as _SettingModel;

  @override
  $Res call({
    Object? dark = freezed,
    Object? isSecure = freezed,
  }) {
    return _then(_SettingModel(
      dark: dark == freezed
          ? _value.dark
          : dark // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSecure: isSecure == freezed
          ? _value.isSecure
          : isSecure // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SettingModel implements _SettingModel {
  _$_SettingModel(
      {@HiveField(0) this.dark = false, @HiveField(1) this.isSecure = false});

  factory _$_SettingModel.fromJson(Map<String, dynamic> json) =>
      _$$_SettingModelFromJson(json);

  @JsonKey()
  @override
  @HiveField(0)
  final bool? dark;
  @JsonKey()
  @override
  @HiveField(1)
  final bool? isSecure;

  @override
  String toString() {
    return 'SettingModel(dark: $dark, isSecure: $isSecure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SettingModel &&
            const DeepCollectionEquality().equals(other.dark, dark) &&
            const DeepCollectionEquality().equals(other.isSecure, isSecure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dark),
      const DeepCollectionEquality().hash(isSecure));

  @JsonKey(ignore: true)
  @override
  _$SettingModelCopyWith<_SettingModel> get copyWith =>
      __$SettingModelCopyWithImpl<_SettingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingModelToJson(this);
  }
}

abstract class _SettingModel implements SettingModel {
  factory _SettingModel(
      {@HiveField(0) bool? dark,
      @HiveField(1) bool? isSecure}) = _$_SettingModel;

  factory _SettingModel.fromJson(Map<String, dynamic> json) =
      _$_SettingModel.fromJson;

  @override
  @HiveField(0)
  bool? get dark;
  @override
  @HiveField(1)
  bool? get isSecure;
  @override
  @JsonKey(ignore: true)
  _$SettingModelCopyWith<_SettingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
