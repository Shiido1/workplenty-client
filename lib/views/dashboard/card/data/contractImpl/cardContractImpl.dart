import 'package:client/core/error/failures.dart';
import 'package:client/views/dashboard/card/data/model/card_response/card_response.dart';
import 'package:client/views/dashboard/card/data/sourceImpl/cardSourceImpl.dart';
import 'package:client/views/dashboard/card/domain/contract/card_contract.dart';
import 'package:client/views/dashboard/card/domain/entity/card_entity.dart';
import 'package:dartz/dartz.dart';

import '../model/save_card_response/save_and_remove_card_response.dart';

class CardContractImpl implements CardContract {
  final CardScourceImpl _impl;

  CardContractImpl(this._impl);

  @override
  Future<Either<Failure, CardResponse>> listCard() async {
    try {
      final _response = await _impl.listCard();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SaveAndRemoveCardResponse>> removeCard(CardEntity entity) async {
    try {
      final _response = await _impl.removeCard(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SaveAndRemoveCardResponse>> saveCard(CardEntity entity) async {
    try {
      final _response = await _impl.saveCard(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
