import 'datum.dart';

class CardResponse {
  String? msg;
  List<Datum>? data;
  bool? success;
  int? code;

  CardResponse({this.msg, this.data, this.success, this.code});

  factory CardResponse.fromJson(Map<String, dynamic> json) => CardResponse(
        msg: json['msg'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
        success: json['success'] as bool?,
        code: json['code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'data': data?.map((e) => e.toJson()).toList(),
        'success': success,
        'code': code,
      };
}
