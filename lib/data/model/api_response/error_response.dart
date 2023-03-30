import 'package:json_annotation/json_annotation.dart';

import '../define.dart';

part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse extends DataModel {
  @JsonKey(name: "success")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "errors")
  List<ErrorResponseDetail>? errors;

  ErrorResponse(this.status, this.message, this.errors);

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => _$ErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}
