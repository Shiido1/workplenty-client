import 'package:client/core/error/failures.dart';
import 'package:client/views/onboarding/data/model/payment/overview_payment_response/overview_model/overview_model.dart';
import 'package:client/views/onboarding/data/sourceImpl/paymentSourceImpl.dart';
import 'package:client/views/onboarding/domain/contract/payment_contract.dart';
import 'package:dartz/dartz.dart';

import '../model/payment/deposit_response/deposit_responce.dart';
import '../model/payment/transaction_response/payment_transaction.dart';

class PaymentContractImpl implements PaymentContract {
  final PaymentSourceImpl _impl;

  PaymentContractImpl(this._impl);

  @override
  Future<Either<Failure, DepositResponce>> depositPayment(entity) async {
    try {
      final _response = await _impl.depositPayment(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, OverviewModel>> overviewPayment() async {
    try {
      final _response = await _impl.overviewPayment();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PaymentTransaction>> transactionPayment() async {
    try {
      final _response = await _impl.transactionPayment();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
