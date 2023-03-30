import 'package:injectable/injectable.dart';

import 'preference/define.dart';

@LazySingleton()
class LocalDataSource {
  final AppPreferences _appPreferences;

  LocalDataSource(this._appPreferences);

  Future<bool> saveIsDarkMode(bool isDarkMode) =>
      _appPreferences.saveIsDarkMode(isDarkMode);

  bool get isDarkMode => _appPreferences.isDarkMode;

  Future<bool> saveIsLoggedIn(bool isLoggedIn) =>
      _appPreferences.saveIsLoggedIn(isLoggedIn);

  bool get isLoggedIn => _appPreferences.isLoggedIn;

  Future<bool> saveAccessToken(String accessToken) =>
      _appPreferences.saveAccessToken(accessToken);

  Future<bool> saveDeviceToken(String deviceToken) =>
      _appPreferences.saveAccessToken(deviceToken);
}
