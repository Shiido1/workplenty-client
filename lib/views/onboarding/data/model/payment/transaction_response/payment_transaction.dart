class PaymentTransaction {
  String? msg;
  dynamic data;
  bool? success;
  int? code;

  PaymentTransaction({this.msg, this.data, this.success, this.code});

  factory PaymentTransaction.fromJson(Map<String, dynamic> json) {
    return PaymentTransaction(
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
