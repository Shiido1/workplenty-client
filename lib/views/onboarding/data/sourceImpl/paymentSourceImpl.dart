import 'package:client/core/api/payment/payment_api.dart';
import 'package:client/views/onboarding/data/model/payment/overview_payment_response/overview_model/overview_model.dart';
import 'package:client/views/onboarding/domain/entity/payment/deposit_entity.dart';
import 'package:client/views/onboarding/domain/source/payment_source.dart';

import '../model/payment/deposit_response/deposit_responce.dart';
import '../model/payment/transaction_response/payment_transaction.dart';

class PaymentSourceImpl implements PaymentSource {
  final PaymentApi _api;

  PaymentSourceImpl({required PaymentApi api}) : _api = api;

  @override
  Future<DepositResponce> depositPayment(DepositEntity entity) async {
    return await _api.depositPayment(entity);
  }

  @override
  Future<OverviewModel> overviewPayment() async {
    return await _api.overviewPayment();
  }

  @override
  Future<PaymentTransaction> transactionPayment() async {
    return await _api.transactionPayment();
  }
}
