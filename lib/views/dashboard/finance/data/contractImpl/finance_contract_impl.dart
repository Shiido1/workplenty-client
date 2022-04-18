import 'package:client/views/dashboard/finance/data/model/transaction_response/transaction_response.dart';
import 'package:client/views/dashboard/finance/data/model/finance_response/finance_response.dart';
import 'package:client/core/error/failures.dart';
import 'package:client/views/dashboard/finance/data/sourceImpl/finance_source_impl.dart';
import 'package:client/views/dashboard/finance/domain/contract/finance_contract.dart';
import 'package:client/views/dashboard/finance/domain/entity/finance_entity.dart';
import 'package:dartz/dartz.dart';

class FinanceContractImpl implements FinanceContract {
  final FinanceSourceImpl _financeSourceImpl;

  FinanceContractImpl(this._financeSourceImpl);

  @override
  Future<Either<Failure, FinanceResponse>> financeWalletBalance() async {
    try {
      final _response = await _financeSourceImpl.walletBalance();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TransactionResponse>>
      financeWalletTransaction() async {
    try {
      final _response = await _financeSourceImpl.walletTransaction();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> financeWalletopup(
      FinanceEntity entity) async {
    try {
      final _response = await _financeSourceImpl.walletTopup(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
