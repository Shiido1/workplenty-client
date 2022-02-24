// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_gig_list.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedGigList _$SavedGigListFromJson(Map<String, dynamic> json) => SavedGigList(
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$SavedGigListToJson(SavedGigList instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'data': instance.data,
      'success': instance.success,
      'code': instance.code,
    };
