import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';
import 'package:client/views/dashboard/card/domain/entity/card_entity.dart';

import '../../../views/dashboard/card/data/model/card_response/card_response.dart';
import '../../../views/dashboard/card/data/model/save_card_response/save_and_remove_card_response.dart';

class CardApi {
  final NetworkService _networkService;

  CardApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<CardResponse> listCard() async {
    try {
      final _response =
          await _networkService.call(UrlConfig.listCard, RequestMethod.get);
      return CardResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<SaveAndRemoveCardResponse> saveCard(CardEntity entity) async {
    try {
      final _response = await _networkService
          .call(UrlConfig.saveCard, RequestMethod.post, data: entity.toSave());
      return SaveAndRemoveCardResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<SaveAndRemoveCardResponse> removeCard(CardEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.removeCard, RequestMethod.post,
          data: entity.toRemove());
      return SaveAndRemoveCardResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }
}
