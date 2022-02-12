import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'revie_list_response_model.g.dart';

@JsonSerializable()
class RevieListResponseModel {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  RevieListResponseModel({this.msg, this.data, this.success, this.code});

  factory RevieListResponseModel.fromJson(Map<String, dynamic> json) {
    return _$RevieListResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RevieListResponseModelToJson(this);
}
