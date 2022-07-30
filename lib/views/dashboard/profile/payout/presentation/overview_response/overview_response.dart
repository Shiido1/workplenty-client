import 'data.dart';

class OverviewResponse {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  OverviewResponse({this.msg, this.data, this.success, this.code});

  factory OverviewResponse.fromJson(Map<String, dynamic> json) {
    return OverviewResponse(
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
