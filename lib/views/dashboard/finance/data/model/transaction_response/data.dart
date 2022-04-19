import 'pagination_meta.dart';

class Data {
  PaginationMeta? paginationMeta;
  List<dynamic>? data;

  Data({this.paginationMeta, this.data});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        paginationMeta: json['pagination_meta'] == null
            ? null
            : PaginationMeta.fromJson(
                json['pagination_meta'] as Map<String, dynamic>),
        data: json['data'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'pagination_meta': paginationMeta?.toJson(),
        'data': data,
      };
}
