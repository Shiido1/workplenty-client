// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatListResponse _$ChatListResponseFromJson(Map<String, dynamic> json) =>
    ChatListResponse(
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$ChatListResponseToJson(ChatListResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'data': instance.data,
      'success': instance.success,
      'code': instance.code,
    };
