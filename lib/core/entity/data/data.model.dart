import 'package:client/core/entity/datum/datum.model.dart';
import 'package:client/core/entity/pagination/pagination_meta.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Data {
  @JsonKey(name: 'pagination_meta')
  PaginationMeta? paginationMeta;
  List<Datum>? data;

  Data({this.paginationMeta, this.data});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
