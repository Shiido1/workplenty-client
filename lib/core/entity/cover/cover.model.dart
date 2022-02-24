import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cover.model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 0)
class Cover {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? path;
  @HiveField(3)
  dynamic mimetype;
  @HiveField(4)
  String? size;
  @JsonKey(name: 'formatted_size')
  @HiveField(5)
  String? formattedSize;
  @HiveField(6)
  @JsonKey(name: 'created_at')
  String? createdAt;

  Cover({
    this.id,
    this.name,
    this.path,
    this.mimetype,
    this.size,
    this.formattedSize,
    this.createdAt,
  });

  factory Cover.fromJson(Map<String, dynamic> json) => _$CoverFromJson(json);

  Map<String, dynamic> toJson() => _$CoverToJson(this);
}
