// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_of_gig_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsOfGigResponse _$DetailsOfGigResponseFromJson(
        Map<String, dynamic> json) =>
    DetailsOfGigResponse(
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      code: json['code'] as int?,
    )..errorDebug = json['errorDebug'];

Map<String, dynamic> _$DetailsOfGigResponseToJson(
        DetailsOfGigResponse instance) =>
    <String, dynamic>{
      'errorDebug': instance.errorDebug,
      'msg': instance.msg,
      'data': instance.data?.toJson(),
      'success': instance.success,
      'code': instance.code,
    };
