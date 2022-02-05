// ignore_for_file: must_be_immutable

import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entity/gig/gig_entity.dart';
import 'data.dart';

part 'available_gig_response.g.dart';

@JsonSerializable(explicitToJson: true)
class AvailableGigResponse extends GigEntity {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  AvailableGigResponse({this.msg, this.data, this.success, this.code});

  factory AvailableGigResponse.fromJson(Map<String, dynamic> json) {
    return _$AvailableGigResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AvailableGigResponseToJson(this);
}
