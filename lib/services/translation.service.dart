import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:my_pocket/app/app.locator.dart';
import 'package:my_pocket/core/managers/stopable_service.dart';
import 'package:my_pocket/core/prefs/pref_handler.dart';
import 'package:my_pocket/locale/app_localizations.g.dart';

import 'package:stacked_services/stacked_services.dart';

class TranslationService extends StoppableService {
  final _sharedPreferencesService = locator<SharedPreferencesService>();
  final _navigationService = locator<NavigationService>();
  Locale _appLocale = Locale(dotenv.env['LOCALE'] ?? 'en');

  Locale get appLocal => _appLocale;

  l() => AppLocalizations.of(_navigationService.navigatorKey!.currentContext!)!;

  @override
  void start() {
    super.start();
    if (kDebugMode) {
      print('LocationService Started $appLocal');
    }
  }

  @override
  void stop() {
    super.stop();

    if (kDebugMode) {
      print('LocationService Stopped $appLocal');
    }
  }

  Future<void> fetchLocale() async {
    var prefs = _sharedPreferencesService;
    if (await prefs.getData(key: 'language_code') == null) {
      _appLocale = Locale(dotenv.env['LOCALE'] ?? 'en');
      return Get.updateLocale(appLocal);
    }
    _appLocale = Locale(await prefs.getData(key: 'language_code'));

    return Get.updateLocale(appLocal);
  }

  Future<void> changeLanguage(String type) async {
    var prefs = _sharedPreferencesService;

    if (_appLocale == Locale(type)) {
      return;
    }
    switch (type) {
      case "en":
        _appLocale = const Locale("en");
        await prefs.saveData(key: 'language_code', value: 'en');
        await prefs.saveData(key: 'countryCode', value: 'US');
        break;
      case "lv":
        _appLocale = const Locale("lv");
        await prefs.saveData(key: 'language_code', value: 'lv');
        await prefs.saveData(key: 'countryCode', value: 'LV');
        break;

      default:
        _appLocale = const Locale("en");
        await prefs.saveData(key: 'language_code', value: 'en');
        await prefs.saveData(key: 'countryCode', value: 'US');
    }
    // Set date locale
    Intl.defaultLocale = type;
    Get.updateLocale(appLocal);
  }
}
