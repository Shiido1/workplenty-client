import 'package:client/core/error/failures.dart';
import 'package:client/views/dashboard/card/data/model/card_response/card_response.dart';
import 'package:client/views/onboarding/domain/entity/card/card_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CardContract {
  Future<Either<Failure, CardResponse>> saveCard(CardEntity entity);
  Future<Either<Failure, CardResponse>> removeCard(CardEntity entity);
  Future<Either<Failure, CardResponse>> listCard();
}
