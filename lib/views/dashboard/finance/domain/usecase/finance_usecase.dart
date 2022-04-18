import 'package:client/core/error/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/dashboard/finance/data/contractImpl/finance_contract_impl.dart';
import 'package:client/views/dashboard/finance/data/model/finance_response/finance_response.dart';
import 'package:client/views/dashboard/finance/data/model/transaction_response/transaction_response.dart';
import 'package:client/views/dashboard/finance/domain/entity/finance_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class FinanceUseCase extends UseCase<FinanceEntity, Params> {
  final FinanceContractImpl _financeContractImpl;

  FinanceUseCase(this._financeContractImpl);

  @override
  Future<Either<Failure, FinanceResponse>>? walletBalanceUseCase() async {
    return await _financeContractImpl.financeWalletBalance();
  }

  @override
  Future<Either<Failure, TransactionResponse>>?
      walletTransactionUseCase() async {
    return await _financeContractImpl.financeWalletTransaction();
  }

  // @override
  // Future<Either<Failure, dynamic>>? walletTopupUseCase(Params params) async {
  //   return await _financeContractImpl.financeWalletopup(params.entity!);
  // }
}

class Params extends Equatable {
  final FinanceEntity? entity;

  const Params({required this.entity});

  @override
  List<Object?> get props => [entity!];
}
