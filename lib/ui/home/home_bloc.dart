import 'dart:async';
import 'dart:ui';

import 'package:flutter_base_architecture/util/extensions/define.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../base/define.dart';

@Injectable()
class HomeBloc extends BaseBloc {
  final _countSubject = BehaviorSubject<int>();
  int count = 0;

  // Input
  late VoidCallback funcClick;

  StreamSink<int> get _streamCountOut => _countSubject.sink;

  // Output
  Stream<int> get streamCount => _countSubject.stream;

  HomeBloc() {
    final clickController = PublishSubject<void>()..disposeBy(disposeBag);

    funcClick = () => clickController.add(null);

    clickController.stream.listen((value) {
      _streamCountOut.add(count++);
    });
  }
}
