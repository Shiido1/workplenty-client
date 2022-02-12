import 'package:json_annotation/json_annotation.dart';

part 'reviewer.g.dart';

@JsonSerializable()
class Reviewer {
  int? id;
  String? avatar;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  String? email;
  String? phone;
  String? role;
  @JsonKey(name: 'created_at')
  String? createdAt;

  Reviewer({
    this.id,
    this.avatar,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.createdAt,
  });

  factory Reviewer.fromJson(Map<String, dynamic> json) {
    return _$ReviewerFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReviewerToJson(this);
}
