import 'package:client/views/dashboard/card/data/model/card_response/card_response.dart';
import 'package:client/views/dashboard/card/domain/entity/card_entity.dart';

import '../../data/model/save_card_response/save_and_remove_card_response.dart';

abstract class CardScource {
  Future<SaveAndRemoveCardResponse> saveCard(CardEntity entity);
  Future<SaveAndRemoveCardResponse> removeCard(CardEntity entity);
  Future<CardResponse> listCard();
}
