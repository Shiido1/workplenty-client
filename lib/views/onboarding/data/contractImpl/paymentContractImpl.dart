import 'package:client/core/error/failures.dart';
import 'package:client/views/onboarding/data/model/payment/deposit_response/deposit_response.dart';
import 'package:client/views/onboarding/data/model/payment/payout_response/payout_response.dart';
import 'package:client/views/onboarding/data/sourceImpl/paymentSourceImpl.dart';
import 'package:client/views/onboarding/domain/contract/payment_contract.dart';
import 'package:client/views/onboarding/domain/entity/payment/payout_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../dashboard/profile/payout/presentation/overview_response/overview_response.dart';
import '../model/payment/transaction_response/transaction_response/transaction_response.dart';

class PaymentContractImpl implements PaymentContract {
  final PaymentSourceImpl _impl;

  PaymentContractImpl(this._impl);

  @override
  Future<Either<Failure, DepositResponse>> depositPayment(entity) async {
    try {
      final _response = await _impl.depositPayment(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, OverviewResponse>> overviewPayment() async {
    try {
      final _response = await _impl.overviewPayment();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TransactionResponse>> transactionPayment() async {
    try {
      final _response = await _impl.transactionPayment();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PayoutResponse>> payout(
      PayoutEntity payoutEntity) async {
    try {
      final _response = await _impl.payoutTransaction(payoutEntity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
