// ignore_for_file: must_be_immutable

import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entity/gig/gig_entity.dart';
import 'data.dart';

part 'saved_client_gig_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SavedClientGigResponse extends GigEntity {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  SavedClientGigResponse({this.msg, this.data, this.success, this.code});

  factory SavedClientGigResponse.fromJson(Map<String, dynamic> json) {
    return _$SavedClientGigResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SavedClientGigResponseToJson(this);
}
