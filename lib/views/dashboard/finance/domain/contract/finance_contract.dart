import 'package:client/core/error/failures.dart';
import 'package:client/views/dashboard/finance/data/model/finance_response/finance_response.dart';
import 'package:client/views/dashboard/finance/data/model/transaction_response/transaction_response.dart';
import 'package:client/views/dashboard/finance/domain/entity/finance_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FinanceContract {
  Future<Either<Failure, FinanceResponse>> financeWalletBalance();
  Future<Either<Failure, TransactionResponse>> financeWalletTransaction();
  Future<Either<Failure, dynamic>> financeWalletopup(FinanceEntity entity);
}
