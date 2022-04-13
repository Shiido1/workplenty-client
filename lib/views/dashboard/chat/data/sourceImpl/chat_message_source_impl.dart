

import 'package:client/core/api/chat/chat_api.dart';
import 'package:client/views/dashboard/chat/data/model/mesage_response/mesage_response.dart';
import 'package:client/views/dashboard/chat/domain/entity/chat_message_entity.dart';
import 'package:client/views/dashboard/chat/domain/source/chat_message_source.dart';

class ChatMessageSourcesImpl implements ChatMessageSource {
  final ChatApi _api;

  ChatMessageSourcesImpl({required ChatApi api}) : _api = api;

  @override
  Future<MesageResponse> chatMeesageSend(MessageEntity entity) async{
    return await _api.chatMessageSend(entity);
  }

  @override
  Future<MesageResponse> chatMessageList(MessageEntity entity) async{
    return await _api.chatMessageList(entity);
  }
}