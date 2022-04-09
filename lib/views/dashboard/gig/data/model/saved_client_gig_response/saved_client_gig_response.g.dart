// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_client_gig_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedClientGigResponse _$SavedClientGigResponseFromJson(
        Map<String, dynamic> json) =>
    SavedClientGigResponse(
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      code: json['code'] as int?,
    )..errorDebug = json['errorDebug'];

Map<String, dynamic> _$SavedClientGigResponseToJson(
        SavedClientGigResponse instance) =>
    <String, dynamic>{
      'errorDebug': instance.errorDebug,
      'msg': instance.msg,
      'data': instance.data?.toJson(),
      'success': instance.success,
      'code': instance.code,
    };
