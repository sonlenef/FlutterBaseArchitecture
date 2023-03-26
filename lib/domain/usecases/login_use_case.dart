import 'package:injectable/injectable.dart';

import '../define.dart';
import 'define.dart';

@Injectable()
class LoginUseCase extends BaseUseCase<LoginInput, User> {
  final AppRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<User> call(LoginInput input) {
    return _repository.login(username: input.email, password: input.password);
  }
}
