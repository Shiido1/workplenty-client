import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';

class ChatApi {
  final NetworkService _networkService;

  ChatApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<dynamic> chatList() async {
    try {
      await _networkService.call(UrlConfig.chatList, RequestMethod.get);
      return;
    } catch (e) {
      rethrow;
    }
  }
}
