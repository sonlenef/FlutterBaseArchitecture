import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tuple/tuple.dart';

import '../../../local/define.dart';
import '../config/api_config.dart';

class AuthInterceptor extends InterceptorsWrapper {
  final AppPreferences appPreferences = GetIt.instance.get<AppPreferences>();
  final _queue = Queue<Tuple2<RequestOptions, ErrorInterceptorHandler>>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = appPreferences.accessToken;

    _putAccessToken(options.headers, accessToken);
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
      final options = err.response!.requestOptions;
    } else {
      handler.next(err);
    }
  }

  void _putAccessToken(Map<String, dynamic> headers, String accessToken) {
    headers[ApiConfig.authorization] = '${ApiConfig.bearer} $accessToken';
  }

  void _onRefreshTokenError(Object? error) {
    for (var element in _queue) {
      final options = element.item1;
      final handler = element.item2;
      handler.next(DioError(requestOptions: options, error: error));
    }
  }
}
