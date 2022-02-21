import 'package:json_annotation/json_annotation.dart';

import 'data.model.dart';

part 'saved_gig_list.model.g.dart';

@JsonSerializable()
class SavedGigList {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  SavedGigList({this.msg, this.data, this.success, this.code});

  factory SavedGigList.fromJson(Map<String, dynamic> json) {
    return _$SavedGigListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SavedGigListToJson(this);
}
