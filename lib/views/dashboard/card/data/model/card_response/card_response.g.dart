// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardResponse _$CardResponseFromJson(Map<String, dynamic> json) => CardResponse(
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool?,
      code: json['code'] as int?,
    )..errorDebug = json['errorDebug'];

Map<String, dynamic> _$CardResponseToJson(CardResponse instance) =>
    <String, dynamic>{
      'errorDebug': instance.errorDebug,
      'msg': instance.msg,
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'success': instance.success,
      'code': instance.code,
    };
