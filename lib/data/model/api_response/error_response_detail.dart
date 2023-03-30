import 'package:json_annotation/json_annotation.dart';

import '../define.dart';

part 'error_response_detail.g.dart';

@JsonSerializable()
class ErrorResponseDetail extends DataModel {
  String? message;

  ErrorResponseDetail(this.message);

  factory ErrorResponseDetail.fromJson(Map<String, dynamic> json) => _$ErrorResponseDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseDetailToJson(this);
}
