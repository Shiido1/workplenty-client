import 'package:client/views/dashboard/chat/data/model/chat_list_response/chat_list_response.dart';

import '../../data/model/mesage_response/mesage_response.dart';
import '../entity/chat_entity.dart';

abstract class ChatSource {
  Future<ChatListResponse> chatList();
  Future<MesageResponse> chatMessageList(ChatEntity entity);
  Future<MesageResponse> chatMeesageSend(ChatEntity entity);
  Future<dynamic> chatInitiate(ChatEntity entity);
}
