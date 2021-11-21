import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'file_model.freezed.dart';
part 'file_model.g.dart';

@freezed
@HiveType(typeId: 1, adapterName: 'FileAdapter')
class FileModel with _$FileModel {
  factory FileModel(
      {@HiveField(0) String? uid,
      @HiveField(1) String? name,
      @HiveField(2) String? path,
      @HiveField(3) String? fileName,
      @HiveField(4) String? ext}) = _FileModel;

  factory FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);
}
