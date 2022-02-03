// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_gig_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveGigResponse _$SaveGigResponseFromJson(Map<String, dynamic> json) =>
    SaveGigResponse(
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      code: json['code'] as int?,
    )..errorDebug = json['errorDebug'];

Map<String, dynamic> _$SaveGigResponseToJson(SaveGigResponse instance) =>
    <String, dynamic>{
      'errorDebug': instance.errorDebug,
      'msg': instance.msg,
      'data': instance.data?.toJson(),
      'success': instance.success,
      'code': instance.code,
    };
