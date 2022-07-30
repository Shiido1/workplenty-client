import 'package:client/core/error/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/onboarding/data/contractImpl/paymentContractImpl.dart';
import 'package:client/views/onboarding/data/model/payment/deposit_response/deposit_response.dart';
import 'package:client/views/onboarding/data/model/payment/payout_response/payout_response.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../dashboard/profile/payout/presentation/overview_response/overview_response.dart';

class PaymentUsecase extends UseCase<dynamic, Params> {
  final PaymentContractImpl _repository;

  PaymentUsecase(this._repository);

  @override
  Future<Either<Failure, DepositResponse>>? depositPayment(Params p) async =>
      await _repository.depositPayment(p.entity);

  @override
  Future<Either<Failure, OverviewResponse>>? overviewPayment() async =>
      await _repository.overviewPayment();

  @override
  Future<Either<Failure, dynamic>>? transactionPayment() async =>
      await _repository.transactionPayment();

  @override
  Future<Either<Failure, PayoutResponse>>? payoutUsecase(Params p) async =>
      await _repository.payout(p.entity);
}

class Params extends Equatable {
  final dynamic entity;

  const Params({required this.entity});

  @override
  List<Object> get props => [entity!];
}
