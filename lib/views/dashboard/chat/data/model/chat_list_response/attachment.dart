import 'package:json_annotation/json_annotation.dart';

part 'attachment.g.dart';

@JsonSerializable()
class Attachment {
  int? id;
  String? name;
  String? path;
  dynamic mimetype;
  String? size;
  @JsonKey(name: 'formatted_size')
  String? formattedSize;
  @JsonKey(name: 'created_at')
  String? createdAt;

  Attachment({
    this.id,
    this.name,
    this.path,
    this.mimetype,
    this.size,
    this.formattedSize,
    this.createdAt,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return _$AttachmentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AttachmentToJson(this);
}
