import '../define.dart';

abstract class AppRepository {
  Future<bool> saveIsDarkMode(bool isDarkMode);

  bool get isDarkMode;
}
