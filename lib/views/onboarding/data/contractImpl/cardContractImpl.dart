import 'package:client/core/error/failures.dart';
import 'package:client/views/onboarding/data/model/card_response/card_response.dart';
import 'package:client/views/onboarding/data/sourceImpl/cardSourceImpl.dart';
import 'package:client/views/onboarding/domain/contract/card_contract.dart';
import 'package:client/views/onboarding/domain/entity/card/card_entity.dart';
import 'package:dartz/dartz.dart';

class CardContractImpl implements CardContract {
  final CardScourceImpl _impl;

  CardContractImpl(this._impl);

  @override
  Future<Either<Failure, CardResponse>> listCard() async {
    try {
      final _response = await _impl.listCard();
      return Right(_response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CardResponse>> removeCard(CardEntity entity) async {
    try {
      final _response = await _impl.removeCard(entity);
      return Right(_response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CardResponse>> saveCard(CardEntity entity) async {
    try {
      final _response = await _impl.saveCard(entity);
      return Right(_response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
