

import 'package:client/views/dashboard/chat/data/model/chat_list_response/chat_list_response.dart';

abstract class ChatSource {
  Future<ChatListResponse> chatList();
}
