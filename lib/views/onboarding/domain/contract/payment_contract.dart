import 'package:client/core/error/failures.dart';
import 'package:client/views/onboarding/data/model/payment/deposit_response/deposit_response.dart';
import 'package:client/views/onboarding/data/model/payment/overview_payment_response/overview_payment_response.dart';
import 'package:client/views/onboarding/data/model/payment/transaction_response/transaction_response.dart';
import 'package:client/views/onboarding/domain/entity/payment/deposit_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PaymentContract {
  Future<Either<Failure, OverViewPaymentResponse>> overviewPayment();
  Future<Either<Failure, DepositResponse>> depositPayment(DepositEntity entity);
  Future<Either<Failure, TransactionResponse>> transactionPayment();
}
