import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';
import 'package:client/views/dashboard/chat/data/model/chat_list_response/chat_list_response.dart';
import 'package:client/views/dashboard/chat/data/model/mesage_response/mesage_response.dart';
import 'package:client/views/dashboard/chat/domain/entity/chat_message_entity.dart';
import 'package:dio/dio.dart';

class ChatApi {
  final NetworkService _networkService;

  ChatApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<ChatListResponse> chatList() async {
    try {
      final _response =
          await _networkService.call(UrlConfig.chatList, RequestMethod.get);
      return ChatListResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<MesageResponse> chatMessageList(MessageEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.chatMessageList, RequestMethod.get,
          queryParams: entity.toMessageList());
      return MesageResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<MesageResponse> chatMessageSend(MessageEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.chatMessageSend, RequestMethod.upload,
          formData:FormData.fromMap(entity.toMessageSend()));
      return MesageResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> chatInitiate() async {
    try {
      await _networkService.call(UrlConfig.chatList, RequestMethod.get);
      return;
    } catch (e) {
      rethrow;
    }
  }
}
