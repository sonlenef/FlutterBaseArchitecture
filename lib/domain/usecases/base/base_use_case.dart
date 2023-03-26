import 'dart:async';

import 'base_input.dart';

abstract class BaseUseCase<In extends BaseInput, Out> {
  Future<Out> call(In input);
}
