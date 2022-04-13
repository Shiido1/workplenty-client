// ignore_for_file: must_be_immutable


import '../../../domain/entity/chat_message_entity.dart';
import 'data.dart';

class MesageResponse extends MessageEntity{
  String? msg;
  Data? data;
  bool? success;
  int? code;

  MesageResponse({this.msg, this.data, this.success, this.code});

  factory MesageResponse.fromJson(Map<String, dynamic> json) {
    return MesageResponse(
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      code: json['code'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'data': data?.toJson(),
        'success': success,
        'code': code,
      };
}
