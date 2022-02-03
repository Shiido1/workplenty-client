import 'package:client/core/api/card/card_api.dart';
import 'package:client/views/dashboard/card/data/model/card_response/card_response.dart';
import 'package:client/views/onboarding/domain/entity/card/card_entity.dart';
import 'package:client/views/dashboard/card/domain/source/card_source.dart';

class CardScourceImpl implements CardScource {
  final CardApi _api;

  CardScourceImpl({required CardApi api}) : _api = api;

  @override
  Future<CardResponse> listCard() async {
    return await _api.listCard();
  }

  @override
  Future<CardResponse> removeCard(CardEntity entity) async {
    return await _api.removeCard(entity);
  }

  @override
  Future<CardResponse> saveCard(CardEntity entity) async {
    return await _api.saveCard(entity);
  }
}
