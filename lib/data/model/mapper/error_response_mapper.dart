import 'package:injectable/injectable.dart';

import '../../../domain/define.dart';
import '../api_response/error_response.dart';
import 'data_mapper.dart';
import 'error_response_detail_mapper.dart';

@Injectable()
class ErrorResponseMapper extends DataMapper<ErrorResponse, ServerError> {
  final ErrorResponseDetailMapper _errorResponseDetailMapper;

  ErrorResponseMapper(this._errorResponseDetailMapper);

  @override
  ServerError mapToEntity(ErrorResponse? data) {
    return ServerError(
        _errorResponseDetailMapper.mapToListEntity(data?.errors));
  }
}
