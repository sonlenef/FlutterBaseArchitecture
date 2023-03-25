import 'package:flutter/foundation.dart';

void printX({required String key, required String value}) {
  if (kDebugMode) {
    print('$key : $value');
  }
}
