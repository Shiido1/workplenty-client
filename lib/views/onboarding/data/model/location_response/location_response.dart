// ignore_for_file: must_be_immutable

import 'package:client/core/entity/default_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'location_response.g.dart';

@JsonSerializable()
class LocationResponse extends DefaultResponse {
  String? msg;
  List<Datum>? data;
  bool? success;
  int? code;

  LocationResponse({this.msg, this.data, this.success, this.code});

  factory LocationResponse.fromJson(Map<String, dynamic> json) {
    return _$LocationResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LocationResponseToJson(this);
}
