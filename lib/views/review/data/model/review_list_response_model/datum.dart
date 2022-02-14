import 'package:json_annotation/json_annotation.dart';

import 'reviewer.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  int? id;
  Reviewer? reviewer;
  int? rating;
  String? comment;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Datum({
    this.id,
    this.reviewer,
    this.rating,
    this.comment,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
