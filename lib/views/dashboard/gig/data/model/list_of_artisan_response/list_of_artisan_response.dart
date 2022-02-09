import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'list_of_artisan_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ListOfArtisanResponse {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  ListOfArtisanResponse({this.msg, this.data, this.success, this.code});

  factory ListOfArtisanResponse.fromJson(Map<String, dynamic> json) {
    return _$ListOfArtisanResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ListOfArtisanResponseToJson(this);
}
