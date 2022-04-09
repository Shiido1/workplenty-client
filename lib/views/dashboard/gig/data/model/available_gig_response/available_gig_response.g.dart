// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_gig_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableGigResponse _$AvailableGigResponseFromJson(
        Map<String, dynamic> json) =>
    AvailableGigResponse(
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      code: json['code'] as int?,
    )..errorDebug = json['errorDebug'];

Map<String, dynamic> _$AvailableGigResponseToJson(
        AvailableGigResponse instance) =>
    <String, dynamic>{
      'errorDebug': instance.errorDebug,
      'msg': instance.msg,
      'data': instance.data?.toJson(),
      'success': instance.success,
      'code': instance.code,
    };
