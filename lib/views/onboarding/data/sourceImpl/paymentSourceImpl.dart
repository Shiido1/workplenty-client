import 'package:client/core/api/payment/payment_api.dart';
import 'package:client/views/onboarding/data/model/payment/deposit_response/deposit_response.dart';
import 'package:client/views/onboarding/data/model/payment/overview_payment_response/overview_payment_response.dart';
import 'package:client/views/onboarding/data/model/payment/transaction_response/transaction_response.dart';
import 'package:client/views/onboarding/domain/entity/payment/deposit_entity.dart';
import 'package:client/views/onboarding/domain/source/payment_source.dart';

import '../../../dashboard/profile/payout/data/model/overview_response/overview_response.dart';
import '../model/payment/deposit_response/deposit_response.dart';

class PaymentSourceImpl implements PaymentSource {
  final PaymentApi _api;

  PaymentSourceImpl({required PaymentApi api}) : _api = api;

  @override
  Future<DepositResponse> depositPayment(DepositEntity entity) async {
    return await _api.depositPayment(entity);
  }

  @override
  Future<OverviewResponse> overviewPayment() async {
    return await _api.overviewPayment();
  }

  @override
  Future<TransactionResponse> transactionPayment() async {
    return await _api.transactionPayment();
  }
}
