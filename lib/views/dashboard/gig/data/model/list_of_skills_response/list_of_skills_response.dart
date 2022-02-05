// ignore_for_file: must_be_immutable

import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entity/gig/gig_entity.dart';
import 'data.dart';

part 'list_of_skills_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ListOfSkillsResponse extends GigEntity {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  ListOfSkillsResponse({this.msg, this.data, this.success, this.code});

  factory ListOfSkillsResponse.fromJson(Map<String, dynamic> json) {
    return _$ListOfSkillsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ListOfSkillsResponseToJson(this);
}
