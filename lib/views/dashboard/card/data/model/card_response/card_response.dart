import 'package:client/views/onboarding/domain/entity/card/card_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'card_response.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class CardResponse extends CardEntity {
  String? msg;
  List<Datum>? data;
  bool? success;
  int? code;

  CardResponse({this.msg, this.data, this.success, this.code});

  factory CardResponse.fromJson(Map<String, dynamic> json) {
    return _$CardResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CardResponseToJson(this);
}
