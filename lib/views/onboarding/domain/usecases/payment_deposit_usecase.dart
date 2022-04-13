import 'package:client/core/error/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/onboarding/data/contractImpl/paymentContractImpl.dart';
import 'package:client/views/onboarding/data/model/payment/deposit_response/deposit_responce.dart';
import 'package:client/views/onboarding/domain/entity/payment/deposit_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/payment/transaction_response/payment_transaction.dart';

class PaymentDepositCases extends UseCase<DepositEntity, Params> {
  final PaymentContractImpl _paymentContractImpl;

  PaymentDepositCases(this._paymentContractImpl);

  @override
  Future<Either<Failure, DepositResponce>> depositPayment(Params params) async {
    return await _paymentContractImpl.depositPayment(params.entity!);
  }

  @override
  Future<Either<Failure, PaymentTransaction>> transactionPayment() async {
    return await _paymentContractImpl.transactionPayment();
  }
}

class Params extends Equatable {
  final DepositEntity? entity;

  const Params({required this.entity});

  @override
  List<Object> get props => [entity!];
}
