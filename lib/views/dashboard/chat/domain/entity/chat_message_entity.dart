// ignore_for_file: must_be_immutable

import 'package:client/core/entity/default_response.dart';
import 'package:dio/dio.dart';

class MessageEntity extends DefaultResponse{
  final String? cardId;
  final String? message;
  final MultipartFile? file;

  MessageEntity({this.message, this.file, this.cardId});

  @override
  List<Object?> get props => [cardId!];

  Map<String, dynamic> toMessageList() {
    return {
      'card_id': '6',
    };
  }

  Map<String, dynamic> toMessageSend() {
    return {
      'card_id': '6',
      'message': 'test',
      'file':file
    };
  }
}
