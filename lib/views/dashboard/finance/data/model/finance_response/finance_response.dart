// ignore_for_file: must_be_immutable

import 'package:client/views/dashboard/finance/domain/entity/finance_entity.dart';

import 'data.dart';

class FinanceResponse extends FinanceEntity{
  String? msg;
  Data? data;
  bool? success;
  int? code;

  FinanceResponse({this.msg, this.data, this.success, this.code});

  factory FinanceResponse.fromJson(Map<String, dynamic> json) {
    return FinanceResponse(
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
