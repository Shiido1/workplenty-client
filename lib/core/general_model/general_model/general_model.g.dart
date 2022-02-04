// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralModel _$GeneralModelFromJson(Map<String, dynamic> json) => GeneralModel(
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$GeneralModelToJson(GeneralModel instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'data': instance.data,
      'success': instance.success,
      'code': instance.code,
    };
