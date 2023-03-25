import 'dart:async';
import 'dart:developer';

class DisposeBagConfig {
  static bool enableLogging = true;
}

class DisposeBag {
  final List<Object> _disposable = [];

  void addDisposable(Object disposable) {
    _disposable.add(disposable);
  }

  void dispose() {
    for (var disposable in _disposable) {
      if (disposable is StreamSubscription) {
        disposable.cancel();
        if (DisposeBagConfig.enableLogging) log('$tag canceled $disposable');
      } else if (disposable is StreamController) {
        disposable.close();
        if (DisposeBagConfig.enableLogging) log('$tag closed $disposable');
      }
    }

    _disposable.clear();
  }

  static const tag = 'DisposeBag';
}
