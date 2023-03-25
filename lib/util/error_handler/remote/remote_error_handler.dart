import 'package:flutter/material.dart';

import '../../../domain/define.dart';
import '../error_handler.dart';
import 'remote_error_listener.dart';

class RemoteErrorHandler
    extends ErrorHandler<RemoteException, RemoteErrorListener> {
  @override
  void proceed(BuildContext context, RemoteException exception,
      RemoteErrorListener listener) {
    switch (exception.type) {
      case RemoteExceptionType.server:
        switch (exception.firstServerErrorCode) {
          case ServerErrorCode.invalidRefreshToken:
          case ServerErrorCode.accountHasDeleted:
          case ServerErrorCode.multipleDeviceLogin:
            listener.onSessionExpiredError(
              context,
              exception.firstServerErrorMessage ??
                  (exception.status ?? "unexpected_error"),
              // TODO: replace => ?? S.of(context).unexpected_error,
            );
            break;
          default:
            listener.onServerError(
              context,
              exception,
            );
            break;
        }

        break;
      case RemoteExceptionType.http:
        if (exception.isServerInternalError) {
          listener.onServerInternalError(
            context,
            "server_down_error", // TODO: replace => S.of(context).server_down_error,
          );
        } else {
          listener.onHttpError(
            context,
            "unexpected_error", // TODO: replace => S.of(context).unexpected_error,
          );
        }
        break;
      case RemoteExceptionType.noInternet:
        listener.onNoInterNetConnectionError(
            context, "check_connection" // S.of(context).check_connection,
            );
        break;
      case RemoteExceptionType.network:
        listener.onNetworkError(context,
            "server_problem_try_later" // S.of(context).server_problem_try_later,
            );
        break;
      case RemoteExceptionType.timeout:
        listener.onTimeoutError(
          context,
          "check_connection", // TODO: replace => S.of(context).check_connection,
        );
        break;
      case RemoteExceptionType.cancellation:
        break;
      case RemoteExceptionType.unexpected:
        listener.onUnexpectedError(context,
            "unexpected_error" // TODO: replace => S.of(context).unexpected_error,
            );
        break;
    }
  }
}
