import 'package:client/core/error/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/dashboard/card/data/contractImpl/cardContractImpl.dart';
import 'package:client/views/dashboard/card/data/model/card_response/card_response.dart';
import 'package:client/views/dashboard/card/domain/entity/card_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CardUseCase extends UseCase<dynamic, Params> {
  final CardContractImpl _cardContractImpl;

  CardUseCase(this._cardContractImpl);

  @override
  Future<Either<Failure, CardResponse>>? getAllCardUseCase() async {
    return await _cardContractImpl.listCard();
  }

  @override
  Future<Either<Failure, dynamic>>? saveCard(Params p) async =>
      await _cardContractImpl.saveCard(p.entity!);

  @override
  Future<Either<Failure, dynamic>>? removeCard(Params p) async =>
      await _cardContractImpl.removeCard(p.entity!);
}

class Params extends Equatable {
  final CardEntity? entity;

  const Params({required this.entity});

  @override
  List<Object?> get props => [entity!];
}
