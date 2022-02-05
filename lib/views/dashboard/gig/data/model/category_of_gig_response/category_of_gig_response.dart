// ignore_for_file: must_be_immutable

import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entity/gig/gig_entity.dart';
import 'data.dart';

part 'category_of_gig_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryOfGigResponse extends GigEntity {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  CategoryOfGigResponse({this.msg, this.data, this.success, this.code});

  factory CategoryOfGigResponse.fromJson(Map<String, dynamic> json) {
    return _$CategoryOfGigResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryOfGigResponseToJson(this);
}
