import 'package:client/views/dashboard/card/data/model/card_response/card_response.dart';
import 'package:client/views/dashboard/card/domain/entity/card_entity.dart';

abstract class CardScource {
  Future<CardResponse> saveCard(CardEntity entity);
  Future<CardResponse> removeCard(CardEntity entity);
  Future<CardResponse> listCard();
}
