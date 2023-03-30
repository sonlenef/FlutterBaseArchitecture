import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../config/define.dart';
import '../config/api_config.dart';

class BasicAuthInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (FlavorConfig.isDevelopment()) {
      options.headers[ApiConfig.authorization] = _basicAuthenticationHeader(
          ApiConfig.basicAuthorizationName,
          ApiConfig.basicAuthorizationPassword);
    }
    return super.onRequest(options, handler);
  }

  static String _basicAuthenticationHeader(
      String basicAuthorizationName, String basicAuthorizationPassword) {
    return 'Basic ${base64Encode(
      utf8.encode('$basicAuthorizationName:$basicAuthorizationPassword'),
    )}';
  }
}
