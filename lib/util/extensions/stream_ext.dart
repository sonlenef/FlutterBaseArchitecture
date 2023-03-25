import 'dart:async';

import '../stream/define.dart';

extension StreamExt<T> on Stream<T> {
  Stream<T> log(
    String name, {
    bool onListen = StreamLogger.needLogOnListen,
    bool onData = StreamLogger.needLogOnData,
    bool onError = StreamLogger.needLogOnError,
    bool onDone = StreamLogger.needLogOnDone,
    bool onCancel = StreamLogger.needLogOnCancel,
  }) {
    return StreamLogger.logOnNotification(
      this,
      name,
      onListen: onListen,
      onData: onData,
      onError: onError,
      onDone: onDone,
      onCancel: onCancel,
    );
  }
}

extension DisposableStreamSubscription on StreamSubscription {
  void disposeBy(DisposeBag disposeBag) {
    disposeBag.addDisposable(this);
  }
}

extension DisposableStreamController on StreamController {
  void disposeBy(DisposeBag disposeBag) {
    disposeBag.addDisposable(this);
  }
}
