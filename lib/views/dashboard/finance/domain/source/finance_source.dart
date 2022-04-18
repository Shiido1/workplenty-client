import 'package:client/views/dashboard/finance/data/model/finance_response/finance_response.dart';
import 'package:client/views/dashboard/finance/domain/entity/finance_entity.dart';

import '../../data/model/transaction_response/transaction_response.dart';

abstract class FinanceSource {
  Future<FinanceResponse> walletBalance();
  Future<TransactionResponse> walletTransaction();
  Future<dynamic> walletTopup(FinanceEntity entity);
}
