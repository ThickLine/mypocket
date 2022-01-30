// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_pocket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyPocketModel _$MyPocketModelFromJson(Map<String, dynamic> json) {
  return _MyPocketModel.fromJson(json);
}

/// @nodoc
class _$MyPocketModelTearOff {
  const _$MyPocketModelTearOff();

  _MyPocketModel call(
      {@HiveField(0) String? uuid,
      @HiveField(1) List<FileModel>? files,
      @HiveField(2) SettingModel? setting}) {
    return _MyPocketModel(
      uuid: uuid,
      files: files,
      setting: setting,
    );
  }

  MyPocketModel fromJson(Map<String, Object?> json) {
    return MyPocketModel.fromJson(json);
  }
}

/// @nodoc
const $MyPocketModel = _$MyPocketModelTearOff();

/// @nodoc
mixin _$MyPocketModel {
  @HiveField(0)
  String? get uuid => throw _privateConstructorUsedError;
  @HiveField(1)
  List<FileModel>? get files => throw _privateConstructorUsedError;
  @HiveField(2)
  SettingModel? get setting => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyPocketModelCopyWith<MyPocketModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPocketModelCopyWith<$Res> {
  factory $MyPocketModelCopyWith(
          MyPocketModel value, $Res Function(MyPocketModel) then) =
      _$MyPocketModelCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String? uuid,
      @HiveField(1) List<FileModel>? files,
      @HiveField(2) SettingModel? setting});

  $SettingModelCopyWith<$Res>? get setting;
}

/// @nodoc
class _$MyPocketModelCopyWithImpl<$Res>
    implements $MyPocketModelCopyWith<$Res> {
  _$MyPocketModelCopyWithImpl(this._value, this._then);

  final MyPocketModel _value;
  // ignore: unused_field
  final $Res Function(MyPocketModel) _then;

  @override
  $Res call({
    Object? uuid = freezed,
    Object? files = freezed,
    Object? setting = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      files: files == freezed
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileModel>?,
      setting: setting == freezed
          ? _value.setting
          : setting // ignore: cast_nullable_to_non_nullable
              as SettingModel?,
    ));
  }

  @override
  $SettingModelCopyWith<$Res>? get setting {
    if (_value.setting == null) {
      return null;
    }

    return $SettingModelCopyWith<$Res>(_value.setting!, (value) {
      return _then(_value.copyWith(setting: value));
    });
  }
}

/// @nodoc
abstract class _$MyPocketModelCopyWith<$Res>
    implements $MyPocketModelCopyWith<$Res> {
  factory _$MyPocketModelCopyWith(
          _MyPocketModel value, $Res Function(_MyPocketModel) then) =
      __$MyPocketModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String? uuid,
      @HiveField(1) List<FileModel>? files,
      @HiveField(2) SettingModel? setting});

  @override
  $SettingModelCopyWith<$Res>? get setting;
}

/// @nodoc
class __$MyPocketModelCopyWithImpl<$Res>
    extends _$MyPocketModelCopyWithImpl<$Res>
    implements _$MyPocketModelCopyWith<$Res> {
  __$MyPocketModelCopyWithImpl(
      _MyPocketModel _value, $Res Function(_MyPocketModel) _then)
      : super(_value, (v) => _then(v as _MyPocketModel));

  @override
  _MyPocketModel get _value => super._value as _MyPocketModel;

  @override
  $Res call({
    Object? uuid = freezed,
    Object? files = freezed,
    Object? setting = freezed,
  }) {
    return _then(_MyPocketModel(
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      files: files == freezed
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileModel>?,
      setting: setting == freezed
          ? _value.setting
          : setting // ignore: cast_nullable_to_non_nullable
              as SettingModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyPocketModel implements _MyPocketModel {
  _$_MyPocketModel(
      {@HiveField(0) this.uuid,
      @HiveField(1) this.files,
      @HiveField(2) this.setting});

  factory _$_MyPocketModel.fromJson(Map<String, dynamic> json) =>
      _$$_MyPocketModelFromJson(json);

  @override
  @HiveField(0)
  final String? uuid;
  @override
  @HiveField(1)
  final List<FileModel>? files;
  @override
  @HiveField(2)
  final SettingModel? setting;

  @override
  String toString() {
    return 'MyPocketModel(uuid: $uuid, files: $files, setting: $setting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MyPocketModel &&
            const DeepCollectionEquality().equals(other.uuid, uuid) &&
            const DeepCollectionEquality().equals(other.files, files) &&
            const DeepCollectionEquality().equals(other.setting, setting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uuid),
      const DeepCollectionEquality().hash(files),
      const DeepCollectionEquality().hash(setting));

  @JsonKey(ignore: true)
  @override
  _$MyPocketModelCopyWith<_MyPocketModel> get copyWith =>
      __$MyPocketModelCopyWithImpl<_MyPocketModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyPocketModelToJson(this);
  }
}

abstract class _MyPocketModel implements MyPocketModel {
  factory _MyPocketModel(
      {@HiveField(0) String? uuid,
      @HiveField(1) List<FileModel>? files,
      @HiveField(2) SettingModel? setting}) = _$_MyPocketModel;

  factory _MyPocketModel.fromJson(Map<String, dynamic> json) =
      _$_MyPocketModel.fromJson;

  @override
  @HiveField(0)
  String? get uuid;
  @override
  @HiveField(1)
  List<FileModel>? get files;
  @override
  @HiveField(2)
  SettingModel? get setting;
  @override
  @JsonKey(ignore: true)
  _$MyPocketModelCopyWith<_MyPocketModel> get copyWith =>
      throw _privateConstructorUsedError;
}
