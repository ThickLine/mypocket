import 'dart:async';
import 'package:my_pocket/app/app.locator.dart';
import 'package:my_pocket/app/app.logger.dart';
import 'package:my_pocket/app/app.router.dart';
import 'package:my_pocket/services/auth.service.dart';
import 'package:my_pocket/services/file.service.dart';
import 'package:my_pocket/services/file_helper.service.dart';
import 'package:my_pocket/services/translation.service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartUpViewModel extends BaseViewModel {
  final log = getLogger('StartUpViewModel');
  final _navigationService = locator<NavigationService>();
  final _fileService = locator<FileService>();
  final _authService = locator<AuthService>();
  final _translationService = locator<TranslationService>();
  final _fileHelperService = locator<FileHelperService>();

  bool _delay = true;

  bool get delay => _delay;

  Future<void> init() async {
    await _fileHelperService.getDirectory();
    await _fileService.initItem();

    await _translationService.fetchLocale();
    await onAuth();

    Future.delayed(Duration(milliseconds: 600), () {
      _delay = false;
      notifyListeners();
    });
  }

  Future<void> onAuth() async {
    // Check if biometrics is available.
    await _authService.onCanCheckBiometrics();
    // Return if [isSecure]  set to false
    if (_fileService.pocket.setting?.isSecure == false)
      return _navigationService.replaceWith(Routes.mainView);

    // If no biometric login available rederict to Home
    await _authService.initAuth();
    if (_authService.availableBiometrics == null ||
        _authService.canCheckBiometrics == false)
      return _navigationService.replaceWith(Routes.mainView);
// On successful auth rederict to Home
    if (_authService.didAuthenticate == true)
      return _navigationService.replaceWith(Routes.mainView);
  }

  /// Here you can set startup delay Shoudn't exceed more than [3 sec]
  Future handleMove() async {
    Duration duration = const Duration(milliseconds: 1500);
    return Timer(duration, init);
  }
}
