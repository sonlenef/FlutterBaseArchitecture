import 'entity.dart';
import 'server_error_detail.dart';

class ServerError extends Entity {
  List<ServerErrorDetail>? errors;

  ServerError(this.errors);
}
