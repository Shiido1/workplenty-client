import 'data.dart';

class OverviewModel {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  OverviewModel({this.msg, this.data, this.success, this.code});

  factory OverviewModel.fromJson(Map<String, dynamic> json) => OverviewModel(
        msg: json['msg'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        success: json['success'] as bool?,
        code: json['code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'data': data?.toJson(),
        'success': success,
        'code': code,
      };
}
