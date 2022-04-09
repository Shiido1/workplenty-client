import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';
import 'package:client/views/dashboard/card/domain/entity/card_entity.dart';

class CardApi {
  final NetworkService _networkService;

  CardApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<dynamic> listCard() async {
    try {
      await _networkService.call(UrlConfig.listCard, RequestMethod.get);
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> saveCard(CardEntity entity) async {
    try {
      await _networkService
          .call(UrlConfig.saveCard, RequestMethod.post, data: {});
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> removeCard(CardEntity entity) async {
    try {
      await _networkService
          .call(UrlConfig.removeCard, RequestMethod.post, data: {});
      return;
    } catch (e) {
      rethrow;
    }
  }
}
