import 'package:client/views/dashboard/chat/domain/entity/chat_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'chat_list_response.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class ChatListResponse extends ChatEntity {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  ChatListResponse({this.msg, this.data, this.success, this.code});

  factory ChatListResponse.fromJson(Map<String, dynamic> json) {
    return _$ChatListResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChatListResponseToJson(this);
}
