// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LastMessage _$LastMessageFromJson(Map<String, dynamic> json) => LastMessage(
      id: json['id'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      message: json['message'] as String?,
      file: json['file'],
      batchNo: json['batch_no'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$LastMessageToJson(LastMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user?.toJson(),
      'message': instance.message,
      'file': instance.file,
      'batch_no': instance.batchNo,
      'created_at': instance.createdAt,
    };
