// ignore_for_file: must_be_immutable

import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entity/gig/gig_entity.dart';
import 'data.dart';

part 'details_of_gig_response.g.dart';

@JsonSerializable(explicitToJson: true)
class DetailsOfGigResponse extends GigEntity {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  DetailsOfGigResponse({this.msg, this.data, this.success, this.code});

  factory DetailsOfGigResponse.fromJson(Map<String, dynamic> json) {
    return _$DetailsOfGigResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DetailsOfGigResponseToJson(this);
}
