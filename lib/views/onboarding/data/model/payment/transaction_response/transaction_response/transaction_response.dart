import 'data.dart';

class TransactionResponse {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  TransactionResponse({this.msg, this.data, this.success, this.code});

  factory TransactionResponse.fromJson(Map<String, dynamic> json) {
    return TransactionResponse(
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
