import 'package:json_annotation/json_annotation.dart';

part 'participant.g.dart';

@JsonSerializable(explicitToJson: true)
class Participant {
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

  Participant({
    this.id,
    this.avatar,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.createdAt,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return _$ParticipantFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ParticipantToJson(this);
}
