import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'fetch_industry_response.g.dart';

@JsonSerializable()
class FetchIndustryResponse {
  String? msg;
  List<Datum>? data;
  bool? success;
  int? code;

  FetchIndustryResponse({this.msg, this.data, this.success, this.code});

  factory FetchIndustryResponse.fromJson(Map<String, dynamic> json) {
    return _$FetchIndustryResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FetchIndustryResponseToJson(this);
}
