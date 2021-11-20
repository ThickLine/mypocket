import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_pocket/app/app.locator.dart';
import 'package:my_pocket/app/app.logger.dart';
import 'package:my_pocket/app/app.router.dart';
import 'package:my_pocket/core/enum/systemwide_enums.dart';
import 'package:my_pocket/models/my_pocket_model/my_pocket_model.dart';
import 'package:my_pocket/models/setting_model/setting_model.dart';
import 'package:my_pocket/services/auth.service.dart';
import 'package:my_pocket/services/file.service.dart';
import 'package:my_pocket/services/translation.service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingViewModel extends BaseViewModel {
  final log = getLogger('SettingViewModel');
  final _fileService = locator<FileService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _translationService = locator<TranslationService>();
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  SettingModel _setting = SettingModel();

  SettingModel get setting => _setting;
  MyPocketModel get pocket => _fileService.pocket;
  // Only show if device supports it
  bool get canCheckBiometrics => _authService.canCheckBiometrics ?? false;
  String get version => dotenv.env['VERSION'] ?? "Just awesome";

  void init() {
    _setting = pocket.setting ?? SettingModel();
  }

// Toggle Light/Dark
  void onThemeChange(value) {
    _setting = setting.copyWith(dark: value);
    _fileService.updateSettings(setting);
    notifyListeners();
  }

// Use biometric
  void onSecureChange(value) {
    _setting = setting.copyWith(isSecure: value);
    _fileService.updateSettings(setting);
    notifyListeners();
  }

// Change locale
  Future<void> onLanguageChange() async {
    var t = _translationService.l();
    var res = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.FLOATING_BOX,
        isScrollControlled: true,
        data: t.localeName);

    if (res?.confirmed == true) {
      _translationService.changeLanguage(res?.data);
    }
  }

// Wipe all data
  Future<void> deletePocket() async {
    var t = _translationService.l();
    var dialog = await _dialogService.showConfirmationDialog(
        title: t.deleteAllFilesTitle,
        description: t.deleteAllFilesQuestion,
        cancelTitle: t.cancel,
        confirmationTitle: t.confirm);

    if (dialog!.confirmed) {
      var res = await _fileService.deleteHive();
      if (res == true) {
        return _navigationService.replaceWith(Routes.startUpView);
      }
      ;
    }
  }
}
