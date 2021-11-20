// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_pocket_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyPocketAdapter extends TypeAdapter<MyPocketModel> {
  @override
  final int typeId = 0;

  @override
  MyPocketModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyPocketModel(
      uuid: fields[0] as String?,
      files: (fields[1] as List?)?.cast<FileModel>(),
      setting: fields[2] as SettingModel?,
    );
  }

  @override
  void write(BinaryWriter writer, MyPocketModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.files)
      ..writeByte(2)
      ..write(obj.setting);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyPocketAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyPocketModel _$$_MyPocketModelFromJson(Map<String, dynamic> json) =>
    _$_MyPocketModel(
      uuid: json['uuid'] as String?,
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => FileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      setting: json['setting'] == null
          ? null
          : SettingModel.fromJson(json['setting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MyPocketModelToJson(_$_MyPocketModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'files': instance.files,
      'setting': instance.setting,
    };
