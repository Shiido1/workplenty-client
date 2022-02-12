// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_profile_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedProfileModelResponse _$SavedProfileModelResponseFromJson(
        Map<String, dynamic> json) =>
    SavedProfileModelResponse(
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$SavedProfileModelResponseToJson(
        SavedProfileModelResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'data': instance.data?.toJson(),
      'success': instance.success,
      'code': instance.code,
    };
