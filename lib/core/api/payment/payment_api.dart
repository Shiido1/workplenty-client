import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';
import 'package:client/views/onboarding/domain/entity/payment/deposit_entity.dart';
import 'package:client/views/onboarding/domain/entity/payment/payout_entity.dart';
import '../../../views/dashboard/profile/payout/presentation/overview_response/overview_response.dart';
import '../../../views/onboarding/data/model/payment/deposit_response/deposit_response.dart';
import '../../../views/onboarding/data/model/payment/payout_response/payout_response.dart';
import '../../../views/onboarding/data/model/payment/transaction_response/transaction_response/transaction_response.dart';

class PaymentApi {
  final NetworkService _networkService;

  PaymentApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<OverviewResponse> overviewPayment() async {
    try {
      final _response = await _networkService.call(
          UrlConfig.overviewPayment, RequestMethod.get);
      return OverviewResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<DepositResponse> depositPayment(DepositEntity entity) async {
    try {
      final _response = await _networkService
          .call(UrlConfig.depositPayment, RequestMethod.post, data: {});
      return DepositResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<TransactionResponse> transactionPayment() async {
    try {
      final _response = await _networkService.call(
          UrlConfig.transactionPayment, RequestMethod.get);
      return TransactionResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<PayoutResponse> payoutTransaction(PayoutEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.SaveBankAccount, RequestMethod.post,
          data: entity.toMap());
      return PayoutResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }
}
