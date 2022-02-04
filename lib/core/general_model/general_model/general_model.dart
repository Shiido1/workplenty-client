import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'general_model.g.dart';

@JsonSerializable()
class GeneralModel {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  GeneralModel({this.msg, this.data, this.success, this.code});

  factory GeneralModel.fromJson(Map<String, dynamic> json) {
    return _$GeneralModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GeneralModelToJson(this);
}
