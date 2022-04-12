// ignore_for_file: must_be_immutable

import 'package:client/views/dashboard/card/domain/entity/card_entity.dart';

class SaveAndRemoveCardResponse extends CardEntity{
  String? msg;
  dynamic data;
  bool? success;
  int? code;

  SaveAndRemoveCardResponse({this.msg, this.data, this.success, this.code});

  factory SaveAndRemoveCardResponse.fromJson(Map<String, dynamic> json) {
    return SaveAndRemoveCardResponse(
      msg: json['msg'] as String?,
      data: json['data'] as dynamic,
      success: json['success'] as bool?,
      code: json['code'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'data': data,
        'success': success,
        'code': code,
      };
}
