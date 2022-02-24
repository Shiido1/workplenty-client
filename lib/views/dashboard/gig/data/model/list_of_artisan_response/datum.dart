import 'package:client/core/entity/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

import 'profile.dart';

part 'datum.g.dart';

@JsonSerializable(explicitToJson: true)
class Datum {
  
  User? user;
  Profile? profile;

  Datum({this.user, this.profile});

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
