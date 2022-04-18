import 'package:client/core/api/finance/finance_api.dart';
import 'package:client/views/dashboard/finance/domain/entity/finance_entity.dart';
import 'package:client/views/dashboard/finance/data/model/finance_response/finance_response.dart';
import 'package:client/views/dashboard/finance/domain/source/finance_source.dart';

import '../model/transaction_response/transaction_response.dart';

class FinanceSourceImpl implements FinanceSource {
  final FinanceApi _financeApi;

  FinanceSourceImpl({required FinanceApi api}) : _financeApi = api;

  @override
  Future<FinanceResponse> walletBalance() async{
    return await _financeApi.walletBalance();
  }

  @override
  Future walletTopup(FinanceEntity entity) async{
    return await _financeApi.walletTopup(entity);
  }

  @override
  Future<TransactionResponse> walletTransaction() async {
    return await _financeApi.walletTransaction();
  }
}
