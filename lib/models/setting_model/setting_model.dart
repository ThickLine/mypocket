import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'setting_model.freezed.dart';
part 'setting_model.g.dart';

@freezed
@HiveType(typeId: 2, adapterName: 'SettingAdapter')
class SettingModel with _$SettingModel {
  factory SettingModel(
      {@HiveField(0) @Default(false) bool? dark,
      @HiveField(1) @Default(false) bool? isSecure}) = _SettingModel;

  factory SettingModel.fromJson(Map<String, dynamic> json) =>
      _$SettingModelFromJson(json);
}
