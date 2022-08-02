import 'package:client/core/error/failures.dart';
import 'package:client/views/onboarding/data/model/payment/deposit_response/deposit_response.dart';
import 'package:client/views/onboarding/domain/entity/payment/deposit_entity.dart';
import 'package:client/views/onboarding/domain/entity/payment/payout_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../dashboard/profile/payout/presentation/overview_response/overview_response.dart';
import '../../data/model/payment/payout_response/payout_response.dart';
import '../../data/model/payment/transaction_response/transaction_response/transaction_response.dart';

abstract class PaymentContract {
  Future<Either<Failure, OverviewResponse>> overviewPayment();
  Future<Either<Failure, DepositResponse>> depositPayment(DepositEntity entity);
  Future<Either<Failure, TransactionResponse>> transactionPayment();
  Future<Either<Failure, PayoutResponse>> payout(PayoutEntity payoutEntity);
}
