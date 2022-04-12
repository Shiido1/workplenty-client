import 'package:client/core/error/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/onboarding/data/contractImpl/paymentContractImpl.dart';
import 'package:client/views/onboarding/data/model/payment/deposit_response/deposit_responce.dart';
import 'package:client/views/onboarding/domain/entity/payment/deposit_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class PaymentDepositCases extends UseCase<DepositEntity, Params> {
  final PaymentContractImpl _paymentContractImpl;

  PaymentDepositCases(this._paymentContractImpl);

  @override
  Future<Either<Failure, DepositResponce>> depositPayment(Params params) async {
    return await _paymentContractImpl.depositPayment(params.entity!);
  }
}

class Params extends Equatable {
  final DepositEntity? entity;

  const Params({required this.entity});

  @override
  List<Object> get props => [entity!];
}
