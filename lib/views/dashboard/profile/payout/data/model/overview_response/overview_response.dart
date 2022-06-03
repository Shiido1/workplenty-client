import 'package:client/core/entity/default_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'overview_response.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class OverviewResponse extends DefaultResponse {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  OverviewResponse({this.msg, this.data, this.success, this.code});

  factory OverviewResponse.fromJson(Map<String, dynamic> json) {
    return _$OverviewResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OverviewResponseToJson(this);
}
