// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_industry_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchIndustryResponse _$FetchIndustryResponseFromJson(
        Map<String, dynamic> json) =>
    FetchIndustryResponse(
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$FetchIndustryResponseToJson(
        FetchIndustryResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'data': instance.data,
      'success': instance.success,
      'code': instance.code,
    };
