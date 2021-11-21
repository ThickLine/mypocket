// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'file_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FileModel _$FileModelFromJson(Map<String, dynamic> json) {
  return _FileModel.fromJson(json);
}

/// @nodoc
class _$FileModelTearOff {
  const _$FileModelTearOff();

  _FileModel call(
      {@HiveField(0) String? uid,
      @HiveField(1) String? name,
      @HiveField(2) String? path,
      @HiveField(3) String? fileName,
      @HiveField(4) String? ext}) {
    return _FileModel(
      uid: uid,
      name: name,
      path: path,
      fileName: fileName,
      ext: ext,
    );
  }

  FileModel fromJson(Map<String, Object?> json) {
    return FileModel.fromJson(json);
  }
}

/// @nodoc
const $FileModel = _$FileModelTearOff();

/// @nodoc
mixin _$FileModel {
  @HiveField(0)
  String? get uid => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get path => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get fileName => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get ext => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileModelCopyWith<FileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileModelCopyWith<$Res> {
  factory $FileModelCopyWith(FileModel value, $Res Function(FileModel) then) =
      _$FileModelCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String? uid,
      @HiveField(1) String? name,
      @HiveField(2) String? path,
      @HiveField(3) String? fileName,
      @HiveField(4) String? ext});
}

/// @nodoc
class _$FileModelCopyWithImpl<$Res> implements $FileModelCopyWith<$Res> {
  _$FileModelCopyWithImpl(this._value, this._then);

  final FileModel _value;
  // ignore: unused_field
  final $Res Function(FileModel) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? path = freezed,
    Object? fileName = freezed,
    Object? ext = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      ext: ext == freezed
          ? _value.ext
          : ext // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$FileModelCopyWith<$Res> implements $FileModelCopyWith<$Res> {
  factory _$FileModelCopyWith(
          _FileModel value, $Res Function(_FileModel) then) =
      __$FileModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String? uid,
      @HiveField(1) String? name,
      @HiveField(2) String? path,
      @HiveField(3) String? fileName,
      @HiveField(4) String? ext});
}

/// @nodoc
class __$FileModelCopyWithImpl<$Res> extends _$FileModelCopyWithImpl<$Res>
    implements _$FileModelCopyWith<$Res> {
  __$FileModelCopyWithImpl(_FileModel _value, $Res Function(_FileModel) _then)
      : super(_value, (v) => _then(v as _FileModel));

  @override
  _FileModel get _value => super._value as _FileModel;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? path = freezed,
    Object? fileName = freezed,
    Object? ext = freezed,
  }) {
    return _then(_FileModel(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      ext: ext == freezed
          ? _value.ext
          : ext // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FileModel implements _FileModel {
  _$_FileModel(
      {@HiveField(0) this.uid,
      @HiveField(1) this.name,
      @HiveField(2) this.path,
      @HiveField(3) this.fileName,
      @HiveField(4) this.ext});

  factory _$_FileModel.fromJson(Map<String, dynamic> json) =>
      _$$_FileModelFromJson(json);

  @override
  @HiveField(0)
  final String? uid;
  @override
  @HiveField(1)
  final String? name;
  @override
  @HiveField(2)
  final String? path;
  @override
  @HiveField(3)
  final String? fileName;
  @override
  @HiveField(4)
  final String? ext;

  @override
  String toString() {
    return 'FileModel(uid: $uid, name: $name, path: $path, fileName: $fileName, ext: $ext)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FileModel &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.ext, ext) || other.ext == ext));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid, name, path, fileName, ext);

  @JsonKey(ignore: true)
  @override
  _$FileModelCopyWith<_FileModel> get copyWith =>
      __$FileModelCopyWithImpl<_FileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FileModelToJson(this);
  }
}

abstract class _FileModel implements FileModel {
  factory _FileModel(
      {@HiveField(0) String? uid,
      @HiveField(1) String? name,
      @HiveField(2) String? path,
      @HiveField(3) String? fileName,
      @HiveField(4) String? ext}) = _$_FileModel;

  factory _FileModel.fromJson(Map<String, dynamic> json) =
      _$_FileModel.fromJson;

  @override
  @HiveField(0)
  String? get uid;
  @override
  @HiveField(1)
  String? get name;
  @override
  @HiveField(2)
  String? get path;
  @override
  @HiveField(3)
  String? get fileName;
  @override
  @HiveField(4)
  String? get ext;
  @override
  @JsonKey(ignore: true)
  _$FileModelCopyWith<_FileModel> get copyWith =>
      throw _privateConstructorUsedError;
}
