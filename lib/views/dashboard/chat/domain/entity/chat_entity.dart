import 'package:client/core/entity/default_response.dart';
import 'package:dio/dio.dart';

// ignore: must_be_immutable
class ChatEntity extends DefaultResponse {
  final String? recipientId;
  final String? gigId;
  final String? message;
  final String? cardId;
  final MultipartFile? file;

  ChatEntity({this.cardId, this.file, this.recipientId, this.gigId, this.message});

  @override
  List<Object?> get props => [recipientId!,gigId!,message!,cardId!,file!];

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

  Map<String, dynamic> initiateMessage() {
    return {
      'recipient_id': '1',
      'gig_id': '1',
      'message': 'test',
    };
  }
}
