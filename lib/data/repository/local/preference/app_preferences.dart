import 'package:flutter_base_architecture/data/repository/local/preference/shared_pref_exception.dart';
import 'package:flutter_base_architecture/data/repository/local/preference/shared_pref_key.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class AppPreferences {
  final SharedPreferences _sharedPreference;

  AppPreferences(this._sharedPreference);

  Future<bool> saveAccessToken(String token) {
    return _sharedPreference
        .setString(SharedPrefKey.accessToken, token)
        .catchError((error) =>
            throw SharedPrefException('Can not save access token', error));
  }

  String get accessToken {
    return _sharedPreference.getString(SharedPrefKey.accessToken) ?? '';
  }

  Future<bool> saveIsLoggedIn(bool isLoggedIn) {
    return _sharedPreference
        .setBool(SharedPrefKey.isLoggedIn, isLoggedIn)
        .catchError((error) =>
            throw SharedPrefException('Can not save isLoggedIn flag', error));
  }

  bool get isLoggedIn {
    return _sharedPreference.getBool(SharedPrefKey.isLoggedIn) ?? false;
  }

  Future<bool> saveIsDarkMode(bool isDarkMode) {
    return _sharedPreference
        .setBool(SharedPrefKey.isDarkMode, isDarkMode)
        .catchError((error) =>
            throw SharedPrefException('Can not save isDarkMode flag', error));
  }

  bool get isDarkMode {
    return _sharedPreference.getBool(SharedPrefKey.isDarkMode) ?? false;
  }

  Future<void> clearAllUserInfo() async {
    await Future.wait([
      _sharedPreference.remove(SharedPrefKey.isLoggedIn),
      _sharedPreference.remove(SharedPrefKey.accessToken),
    ]);
  }
}
