import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/entity/data/data.model.dart';

part 'gigs_response.g.dart';

@JsonSerializable()
class GigsResponse {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  GigsResponse({this.msg, this.data, this.success, this.code});

  factory GigsResponse.fromJson(Map<String, dynamic> json) {
    return _$GigsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GigsResponseToJson(this);
}
