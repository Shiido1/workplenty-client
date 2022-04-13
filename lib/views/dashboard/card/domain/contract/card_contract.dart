import 'package:client/core/error/failures.dart';
import 'package:client/views/dashboard/card/data/model/card_response/card_response.dart';
import 'package:client/views/dashboard/card/domain/entity/card_entity.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/save_card_response/save_and_remove_card_response.dart';

abstract class CardContract {
  Future<Either<Failure, SaveAndRemoveCardResponse>> saveCard(CardEntity entity);
  Future<Either<Failure, SaveAndRemoveCardResponse>> removeCard(CardEntity entity);
  Future<Either<Failure, CardResponse>> listCard();
}
