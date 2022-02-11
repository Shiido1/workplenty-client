// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revie_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RevieListResponseModel _$RevieListResponseModelFromJson(
        Map<String, dynamic> json) =>
    RevieListResponseModel(
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$RevieListResponseModelToJson(
        RevieListResponseModel instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'data': instance.data,
      'success': instance.success,
      'code': instance.code,
    };
