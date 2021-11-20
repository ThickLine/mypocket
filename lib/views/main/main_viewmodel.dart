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

  MyPocketModel? get pocket => _fileService.pocket;
  String get date => UtilMixin.getDate();

  Future onFileUpload() async {
    return _navigationService.navigateTo(Routes.uploadView);
  }

  Future onSettingRoute() async {
    return _navigationService.navigateTo(Routes.settingView);
  }
}
