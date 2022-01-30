import 'dart:async';

import 'package:my_pocket/app/app.locator.dart';
import 'package:my_pocket/app/app.logger.dart';
import 'package:my_pocket/app/app.router.dart';
import 'package:my_pocket/mixin/util.mixin.dart';
import 'package:my_pocket/models/my_pocket_model/my_pocket_model.dart';
import 'package:my_pocket/services/file.service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MainViewModel extends IndexTrackingViewModel {
  final log = getLogger('MainViewModel');
  final _navigationService = locator<NavigationService>();
  final _fileService = locator<FileService>();

  final int _active = 0;

  int get active => _active;
  MyPocketModel? get pocket => _fileService.pocket;
  bool get isList => pocket!.files!.isNotEmpty;
  String get date => UtilMixin.getDate();

  void init() {}

// On file uploud button tap
  Future onFileUpload() async {
    return _navigationService.navigateTo(Routes.uploadView);
  }

// Route to setting screen
  Future onSettingRoute() async {
    return _navigationService.navigateTo(Routes.settingView);
  }
}
