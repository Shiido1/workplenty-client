import 'package:client/views/onboarding/data/model/payment/overview_payment_response/overview_model/overview_model.dart';
import 'package:client/views/onboarding/domain/entity/payment/deposit_entity.dart';

import '../../data/model/payment/deposit_response/deposit_responce.dart';
import '../../data/model/payment/transaction_response/payment_transaction.dart';

abstract class PaymentSource {
  Future<OverviewModel> overviewPayment();
  Future<DepositResponce> depositPayment(DepositEntity entity);
  Future<PaymentTransaction> transactionPayment();
}
