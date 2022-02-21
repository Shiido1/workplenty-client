import 'package:json_annotation/json_annotation.dart';

part 'skill.model.g.dart';

@JsonSerializable()
class Skill {
  int? id;
  String? name;
  @JsonKey(name: 'created_at')
  String? createdAt;

  Skill({this.id, this.name, this.createdAt});

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);

  Map<String, dynamic> toJson() => _$SkillToJson(this);
}
