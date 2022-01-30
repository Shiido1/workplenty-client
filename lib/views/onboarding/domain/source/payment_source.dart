import 'package:client/views/onboarding/data/model/payment/deposit_response/deposit_response.dart';
import 'package:client/views/onboarding/data/model/payment/overview_payment_response/overview_payment_response.dart';
import 'package:client/views/onboarding/data/model/payment/transaction_response/transaction_response.dart';
import 'package:client/views/onboarding/domain/entity/payment/deposit_entity.dart';

abstract class PaymentSource {
  Future<OverViewPaymentResponse> overviewPayment();
  Future<DepositResponse> depositPayment(DepositEntity entity);
  Future<TransactionResponse> transactionPayment();
}
