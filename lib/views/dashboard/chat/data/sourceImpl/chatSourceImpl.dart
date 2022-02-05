import 'package:client/core/api/chat/chat_api.dart';
import 'package:client/views/dashboard/chat/data/model/chat_list_response/chat_list_response.dart';
import 'package:client/views/dashboard/chat/domain/source/chat_source.dart';

class ChatSourcesImpl implements ChatSource {
  final ChatApi _api;

  ChatSourcesImpl({required ChatApi api}) : _api = api;

  @override
  Future<ChatListResponse> chatList() async {
    return await _api.chatList();
  }
}
