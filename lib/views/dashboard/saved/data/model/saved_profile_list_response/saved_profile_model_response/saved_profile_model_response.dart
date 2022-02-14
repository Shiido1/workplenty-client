import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'saved_profile_model_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SavedProfileModelResponse {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  SavedProfileModelResponse({this.msg, this.data, this.success, this.code});

  factory SavedProfileModelResponse.fromJson(Map<String, dynamic> json) {
    return _$SavedProfileModelResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SavedProfileModelResponseToJson(this);
}
