import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';
import 'package:client/views/onboarding/domain/entity/payment/deposit_entity.dart';

class PaymentApi {
  final NetworkService _networkService;

  PaymentApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<dynamic> overviewPayment() async {
    try {
      await _networkService.call(UrlConfig.overviewPayment, RequestMethod.get);
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> depositPayment(DepositEntity entity) async {
    try {
      await _networkService
          .call(UrlConfig.depositPayment, RequestMethod.post, data: {});
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> transactionPayment() async {
    try {
      await _networkService.call(
          UrlConfig.transactionPayment, RequestMethod.get);
      return;
    } catch (e) {
      rethrow;
    }
  }
}
