import 'package:client/views/onboarding/data/model/card_response/card_response.dart';
import 'package:client/views/onboarding/domain/entity/card/card_entity.dart';

abstract class CardScource {
  Future<CardResponse> saveCard(CardEntity entity);
  Future<CardResponse> removeCard(CardEntity entity);
  Future<CardResponse> listCard();
}
