import 'package:client/core/helper/configs/instances.dart';
import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';
import 'package:client/views/dashboard/card/data/model/card_response/card_response.dart';
import 'package:client/views/dashboard/card/domain/entity/card_entity.dart';

class CardApi {
  final NetworkService _networkService;

  CardApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<CardResponse> listCard() async {
    try {
      final _reseponse =
          await _networkService.call(UrlConfig.listCard, RequestMethod.get);
      return CardResponse.fromJson(_reseponse.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<CardResponse> saveCard(CardEntity entity) async {
    try {
      final _response = await _networkService
          .call(UrlConfig.saveCard, RequestMethod.post, data: entity.save());
      logger.d(_response);
      return CardResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<CardResponse> removeCard(CardEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.removeCard, RequestMethod.post,
          data: entity.remove());
      return CardResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }
}
