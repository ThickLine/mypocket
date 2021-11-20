import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_pocket/models/file/file_model.dart';
import 'package:my_pocket/models/setting_model/setting_model.dart';

part 'my_pocket_model.freezed.dart';
part 'my_pocket_model.g.dart';

@freezed
@HiveType(typeId: 0, adapterName: 'MyPocketAdapter')
class MyPocketModel with _$MyPocketModel {
  factory MyPocketModel(
      {@HiveField(0) String? uuid,
      @HiveField(1) List<FileModel>? files,
      @HiveField(2) SettingModel? setting}) = _MyPocketModel;

  factory MyPocketModel.fromJson(Map<String, dynamic> json) =>
      _$MyPocketModelFromJson(json);
}
