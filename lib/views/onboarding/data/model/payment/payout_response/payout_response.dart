// ignore_for_file: must_be_immutable

import 'package:client/views/onboarding/domain/entity/payment/payout_entity.dart';

import 'data.dart';

class PayoutResponse extends PayoutEntity {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  PayoutResponse({this.msg, this.data, this.success, this.code});

  factory PayoutResponse.fromJson(Map<String, dynamic> json) {
    return PayoutResponse(
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
