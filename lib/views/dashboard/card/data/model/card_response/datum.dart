import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable(explicitToJson: true)
class Datum {
  String? name;
  String? number;
  @JsonKey(name: 'is_default')
  int? isDefault;

  Datum({this.name, this.number, this.isDefault});

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
