// ignore_for_file: must_be_immutable

import 'package:client/views/onboarding/domain/entity/payment/deposit_entity.dart';

class DepositResponce extends DepositEntity {
  String? msg;
  dynamic data;
  bool? success;
  int? code;

  DepositResponce({this.msg, this.data, this.success, this.code});

  factory DepositResponce.fromJson(Map<String, dynamic> json) {
    return DepositResponce(
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
