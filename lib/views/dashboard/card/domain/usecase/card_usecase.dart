import 'package:client/core/error/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/dashboard/card/data/contractImpl/cardContractImpl.dart';
import 'package:client/views/dashboard/card/data/model/card_response/card_response.dart';
import 'package:client/views/dashboard/card/domain/entity/card_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/save_card_response/save_and_remove_card_response.dart';

class CardUseCase extends UseCase<CardEntity, Params> {
  final CardContractImpl _cardContractImpl;

  CardUseCase(this._cardContractImpl);

  @override
  Future<Either<Failure, CardResponse>>? getAllCardUseCase() async {
    return await _cardContractImpl.listCard();
  }

  @override
  Future<Either<Failure, SaveAndRemoveCardResponse>>? saveCardUseCase(
      Params params) async {
    return await _cardContractImpl.saveCard(params.entity!);
  }

  @override
  Future<Either<Failure, SaveAndRemoveCardResponse>>? removeCardUseCase(
      Params params) async {
    return await _cardContractImpl.removeCard(params.entity!);
  }
}

class Params extends Equatable {
  final CardEntity? entity;

  const Params({required this.entity});

  @override
  List<Object?> get props => [entity!];
}
