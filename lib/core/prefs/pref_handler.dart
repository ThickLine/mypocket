import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;

  static Future<SharedPreferencesService> getInstance(
      {bool enableLogs = false}) async {
    if (_instance == null) {
      _instance = SharedPreferencesService._(
        await SharedPreferences.getInstance(),
        enableLogs,
      );
    }
    return _instance!;
  }

  final enableLogs;

  final SharedPreferences _pref;

  SharedPreferencesService._(
    this._pref,
    this.enableLogs,
  );

  Future<dynamic> getData({String? key}) async {
    return _pref.getString(key!);
  }

  Future<dynamic> getDataInt({String? key}) async {
    return _pref.getInt(key!);
  }

  Future<void> saveData({String? key, String? value}) {
    return _pref.setString(key!, value!);
  }

  Future<void> saveDataInt({String? key, int? value}) {
    return _pref.setInt(key!, value!);
  }

  Future<bool> deleteData({String? key}) {
    return _pref.remove(key!);
  }

  Future<bool> clearData() {
    return _pref.clear();
  }
}
