import 'package:injectable/injectable.dart';

import '../../domain/define.dart';
import 'local/define.dart';
import 'remote/remote_data_source.dart';

@LazySingleton(as: AppRepository)
class RepositoryImpl extends AppRepository {
  final LocalDataSource _localDataSource;
  final RemoteDataSource _remoteDataSource;

  RepositoryImpl(this._localDataSource, this._remoteDataSource);

  @override
  bool get isDarkMode => _localDataSource.isDarkMode;

  @override
  Future<bool> saveIsDarkMode(bool isDarkMode) {
    return _localDataSource.saveIsDarkMode(isDarkMode);
  }

  Future<List<Object>> _saveLocalData(String token) async {
    return Future.wait([
      _localDataSource.saveAccessToken(token),
      _localDataSource.saveIsLoggedIn(true),
    ]);
  }
}
