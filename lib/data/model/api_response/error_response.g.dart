// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      json['success'] as bool?,
      json['message'] as String?,
      (json['errors'] as List<dynamic>?)
          ?.map((e) => ErrorResponseDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'success': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };
