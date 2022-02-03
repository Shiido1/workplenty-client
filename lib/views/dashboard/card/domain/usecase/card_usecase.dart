import 'package:client/core/error/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/dashboard/card/data/contractImpl/cardContractImpl.dart';
import 'package:client/views/dashboard/card/data/model/card_response/card_response.dart';
import 'package:dartz/dartz.dart';

class CardUseCase extends UseCase {
  final CardContractImpl _cardContractImpl;

  CardUseCase(this._cardContractImpl);

  @override
  Future<Either<Failure, CardResponse>>? getAllCardUseCase() async {
    return await _cardContractImpl.listCard();
  }
}

// class Params extends Equatable {
//   final GigEntity? entity;

//   const Params({required this.entity});

//   @override
//   List<Object?> get props => [entity!];
// }