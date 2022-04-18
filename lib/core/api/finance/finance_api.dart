import 'package:client/core/network/network_service.dart';
import 'package:client/views/dashboard/finance/domain/entity/finance_entity.dart';
import 'package:dio/dio.dart';

import '../../../views/dashboard/finance/data/model/finance_response/finance_response.dart';
import '../../../views/dashboard/finance/data/model/transaction_response/transaction_response.dart';
import '../../network/url_config.dart';

class FinanceApi {
  final NetworkService _networkService;

  FinanceApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<FinanceResponse> walletBalance() async {
    try {
      final _response = await _networkService.call(
          UrlConfig.walletBalance, RequestMethod.get);
      return FinanceResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<TransactionResponse> walletTransaction() async {
    try {
      final _response = await _networkService.call(
          UrlConfig.walletTransaction, RequestMethod.get);
      return TransactionResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> walletTopup(FinanceEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.walletTopup, RequestMethod.post,formData: FormData.fromMap(entity.toTopup()));
      return _response.data;
    } catch (e) {
      rethrow;
    }
  }

  
}
