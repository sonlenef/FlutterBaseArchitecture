import 'package:flutter/material.dart';

import '../../../domain/define.dart';
import '../error_handler.dart';
import 'local_error_listener.dart';

class LocalErrorHandler extends ErrorHandler<LocalException, LocalErrorListener> {
  @override
  void proceed(BuildContext context, LocalException exception, LocalErrorListener listener) {}
}
