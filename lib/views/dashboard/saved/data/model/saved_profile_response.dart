class SavedProfileResponse {
  String? msg;
  dynamic data;
  bool? success;
  int? code;

  SavedProfileResponse({this.msg, this.data, this.success, this.code});

  factory SavedProfileResponse.fromJson(Map<String, dynamic> json) {
    return SavedProfileResponse(
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
