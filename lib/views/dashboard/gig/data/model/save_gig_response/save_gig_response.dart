// ignore_for_file: must_be_immutable

import 'package:client/views/dashboard/gig/domain/entity/gig/gig_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'save_gig_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SaveGigResponse extends GigEntity {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  SaveGigResponse({this.msg, this.data, this.success, this.code});

  factory SaveGigResponse.fromJson(Map<String, dynamic> json) {
    return _$SaveGigResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SaveGigResponseToJson(this);
}
