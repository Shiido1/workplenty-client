import 'package:json_annotation/json_annotation.dart';

import 'gig.dart';
import 'last_message.dart';
import 'participant.dart';

part 'datum.g.dart';

@JsonSerializable(explicitToJson: true)
class Datum {
  int? id;
  @JsonKey(name: 'last_message')
  LastMessage? lastMessage;
  List<Participant>? participants;
  Gig? gig;

  Datum({this.id, this.lastMessage, this.participants, this.gig});

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
