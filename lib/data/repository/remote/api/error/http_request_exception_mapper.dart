import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/define.dart';
import '../../../../model/define.dart';

@Injectable()
class HttpRequestExceptionMapper extends ExceptionMapper<RemoteException> {
  final ErrorResponseMapper _errorResponseMapper;

  HttpRequestExceptionMapper(this._errorResponseMapper);

  @override
  RemoteException map(Object? exception) {
    if (exception is DioError) {
      if (exception.error is RemoteException) {
        return exception.error as RemoteException;
      }

      switch (exception.type) {
        case DioErrorType.cancel:
          return const RemoteException.cancellationError();
        case DioErrorType.sendTimeout:
          return const RemoteException.noInternet();
        case DioErrorType.receiveTimeout:
          return const RemoteException.timeoutError();
        case DioErrorType.connectionTimeout:
          return const RemoteException.timeoutError();
        case DioErrorType.badCertificate:
        case DioErrorType.badResponse:
          if (exception.response?.data != null) {
            final errorResponse =
            ErrorResponse.fromJson(exception.response!.data!);
            return RemoteException.serverError(
              exception.response!.statusCode,
              _errorResponseMapper.mapToEntity(errorResponse),
              errorResponse.message,
            );
          } else {
            return RemoteException.httpError(exception.response!.statusCode);
          }
        case DioErrorType.connectionError:
        case DioErrorType.unknown:
      }
    }

    return RemoteException.unexpectedError(exception is Exception
        ? exception
        : Exception(exception?.toString() ?? "Unexpected error"));
  }
}
