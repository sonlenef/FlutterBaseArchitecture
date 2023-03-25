import 'package:rxdart/rxdart.dart';

import '../log/log_utils.dart';

class StreamLoggerConfig {
  static bool enableStreamLogger = true;
}

class StreamLogger {
  static const bool needLogOnListen = true;
  static const bool needLogOnData = true;
  static const bool needLogOnError = true;
  static const bool needLogOnDone = true;
  static const bool needLogOnCancel = true;

  const StreamLogger._();

  static Stream<T> logOnNotification<T>(
    Stream<T> stream,
    String name, {
    required bool onListen,
    required bool onData,
    required bool onError,
    required bool onDone,
    required bool onCancel,
  }) {
    return stream.doOnListen(() {
      if (onListen) {
        printX(
            key: '▶️ ${DateTime.now().toString()}',
            value: '$name onSubscribed');
      }
    }).doOnData((event) {
      if (onData) {
        printX(key: '🟢 ${DateTime.now()}', value: '$name onNext: $event');
      }
    }).doOnCancel(() {
      if (onCancel) {
        printX(
            key: '🟡 ${DateTime.now().toString()}', value: '$name onCanceled');
      }
    }).doOnError((e, _) {
      if (onError) {
        printX(
            key: '🔴 ${DateTime.now().toString()}', value: '$name onError: $e');
      }
    }).doOnDone(() {
      if (onDone) {
        printX(
            key: '☑️${DateTime.now().toString()}', value: '$name onCompleted');
      }
    });
  }
}
