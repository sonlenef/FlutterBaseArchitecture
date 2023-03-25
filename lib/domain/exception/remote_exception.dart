import 'package:collection/collection.dart';

import '../define.dart';

enum RemoteExceptionType {
  noInternet,
  network,
  http,
  server,
  timeout,
  cancellation,
  unexpected,
}

class RemoteException implements Exception {
  final RemoteExceptionType type;
  final int? statusCode;
  final String? status;
  final ServerError? errorResponse;
  final Exception? exception;

  const RemoteException._(
    this.type, {
    this.statusCode,
    this.status,
    this.exception,
    this.errorResponse,
  });

  const RemoteException.httpError(int? statusCode)
      : this._(RemoteExceptionType.http, statusCode: statusCode);

  const RemoteException.serverError(
      int? statusCode, ServerError serverError, String? status)
      : this._(RemoteExceptionType.server,
            statusCode: statusCode, errorResponse: serverError, status: status);

  const RemoteException.networkError(
    int? statusCode,
  ) : this._(RemoteExceptionType.network, statusCode: statusCode);

  const RemoteException.noInternet() : this._(RemoteExceptionType.noInternet);

  const RemoteException.timeoutError() : this._(RemoteExceptionType.timeout);

  const RemoteException.cancellationError()
      : this._(RemoteExceptionType.cancellation);

  const RemoteException.unexpectedError(Exception exception)
      : this._(RemoteExceptionType.unexpected);

  List<ServerErrorDetail>? get serverErrors => errorResponse?.errors;

  int? get firstServerErrorCode => serverErrors?.firstOrNull?.hashCode;

  String? get firstServerErrorMessage =>
      serverErrors?.firstOrNull?.messageError;

  bool get isServerInternalError =>
      statusCode != null && statusCode! >= 500 && statusCode! <= 599;

  @override
  String toString() {
    return 'RemoteException: {kind: $type, statusCode: $statusCode, errorResponse: $errorResponse, exception: $exception}';
  }
}
