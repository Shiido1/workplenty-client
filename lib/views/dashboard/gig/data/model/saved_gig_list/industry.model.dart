import 'package:json_annotation/json_annotation.dart';

import 'cover.model.dart';

part 'industry.model.g.dart';

@JsonSerializable()
class Industry {
  int? id;
  String? name;
  Cover? cover;
  @JsonKey(name: 'category_id')
  dynamic categoryId;

  Industry({this.id, this.name, this.cover, this.categoryId});

  factory Industry.fromJson(Map<String, dynamic> json) {
    return _$IndustryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$IndustryToJson(this);
}
