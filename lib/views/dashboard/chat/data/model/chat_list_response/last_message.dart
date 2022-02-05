import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'last_message.g.dart';

@JsonSerializable(explicitToJson: true)
class LastMessage {
  int? id;
  User? user;
  String? message;
  dynamic file;
  @JsonKey(name: 'batch_no')
  String? batchNo;
  @JsonKey(name: 'created_at')
  String? createdAt;

  LastMessage({
    this.id,
    this.user,
    this.message,
    this.file,
    this.batchNo,
    this.createdAt,
  });

  factory LastMessage.fromJson(Map<String, dynamic> json) {
    return _$LastMessageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LastMessageToJson(this);
}
