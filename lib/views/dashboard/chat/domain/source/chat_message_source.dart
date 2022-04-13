

import 'package:client/views/dashboard/chat/data/model/mesage_response/mesage_response.dart';
import 'package:client/views/dashboard/chat/domain/entity/chat_message_entity.dart';

abstract class ChatMessageSource {
  Future<MesageResponse> chatMessageList(MessageEntity entity);
  Future<MesageResponse> chatMeesageSend(MessageEntity entity);
}