import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';
import 'package:client/views/onboarding/data/model/payment/overview_payment_response/overview_model/overview_model.dart';
import 'package:client/views/onboarding/domain/entity/payment/deposit_entity.dart';

import '../../../views/onboarding/data/model/payment/deposit_response/deposit_responce.dart';
import '../../../views/onboarding/data/model/payment/transaction_response/payment_transaction.dart';

class PaymentApi {
  final NetworkService _networkService;

  PaymentApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<OverviewModel> overviewPayment() async {
    try {
      final _response = await _networkService.call(
          UrlConfig.overviewPayment, RequestMethod.get);
      return OverviewModel.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<DepositResponce> depositPayment(DepositEntity entity) async {
    try {
      final _response = await _networkService
          .call(UrlConfig.depositPayment, RequestMethod.post, data: {});
      return DepositResponce.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<PaymentTransaction> transactionPayment() async {
    try {
      final _response = await _networkService.call(
          UrlConfig.transactionPayment, RequestMethod.get);
      return PaymentTransaction.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }
}
