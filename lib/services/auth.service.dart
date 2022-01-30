import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:my_pocket/app/app.locator.dart';
import 'package:my_pocket/app/app.logger.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:my_pocket/services/translation.service.dart';

class AuthService {
  final log = getLogger('StartUpViewModel');
  final LocalAuthentication auth = LocalAuthentication();
  final _translationService = locator<TranslationService>();

  List<BiometricType>? _availableBiometrics;
  final String _authorized = 'Not Authorized';
  bool _didAuthenticate = false;
  bool _isAuthenticating = false;
  bool? _canCheckBiometrics;

  List<BiometricType>? get availableBiometrics => _availableBiometrics;
  String get authorized => _authorized;
  bool get isAuthenticating => _isAuthenticating;
  bool get didAuthenticate => _didAuthenticate;
  bool? get canCheckBiometrics => _canCheckBiometrics;

  Future<void> initAuth() async {
    var t = _translationService.l();
    _canCheckBiometrics = await onCanCheckBiometrics();
    await getAvailableBiometrics();
    if (_canCheckBiometrics == true) {
      await getAvailableBiometrics();
      // await authenticateWithBiometrics();
      var localAuth = LocalAuthentication();

      if (isAuthenticating == false) {
        try {
          _didAuthenticate = await localAuth.authenticate(
              localizedReason: t.localizedReasonTitle);
        } on PlatformException catch (e) {
          if (e.code == auth_error.notAvailable) {
            log.e(e);
            // Handle this exception here.
          }
        }
      }
    }
  }

// Check if biometric login is available
  Future<bool> onCanCheckBiometrics() async {
    try {
      return _canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      log.e(e);
      return false;
    }
  }

// List available options of biometric login
  Future<void> getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      log.e(e);
    }
    _availableBiometrics = availableBiometrics;
  }

  void cancelAuthentication() async {
    await auth.stopAuthentication();
    _isAuthenticating = false;
  }
}
