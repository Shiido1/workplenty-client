import 'package:client/views/dashboard/gig/domain/entity/gig/gig_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/entity/data/data.model.dart';

part 'gigs_response.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class GigsResponse extends GigEntity {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  GigsResponse({this.msg, this.data, this.success, this.code});

  factory GigsResponse.fromJson(Map<String, dynamic> json) {
    return _$GigsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GigsResponseToJson(this);
}
