// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_of_artisan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOfArtisanResponse _$ListOfArtisanResponseFromJson(
        Map<String, dynamic> json) =>
    ListOfArtisanResponse(
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$ListOfArtisanResponseToJson(
        ListOfArtisanResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'data': instance.data?.toJson(),
      'success': instance.success,
      'code': instance.code,
    };
