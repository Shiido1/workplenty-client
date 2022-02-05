import 'package:json_annotation/json_annotation.dart';

part 'industry.g.dart';

@JsonSerializable(explicitToJson: true)
class Industry {
  int? id;
  @JsonKey(name: 'category_id')
  dynamic categoryId;
  String? name;
  @JsonKey(name: 'created_at')
  dynamic createdAt;

  Industry({this.id, this.categoryId, this.name, this.createdAt});

  factory Industry.fromJson(Map<String, dynamic> json) {
    return _$IndustryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$IndustryToJson(this);
}
