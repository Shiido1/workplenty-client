import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable(explicitToJson: true)
class Datum {
  int? id;
  @JsonKey(name: 'category_id')
  dynamic categoryId;
  String? name;
  @JsonKey(name: 'created_at')
  dynamic createdAt;

  Datum({this.id, this.categoryId, this.name, this.createdAt});

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
