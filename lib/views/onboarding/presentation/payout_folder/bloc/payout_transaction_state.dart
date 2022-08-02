part of 'payout_transaction_bloc.dart';

abstract class PayoutTransactionState extends Equatable {
  const PayoutTransactionState();
  @override
  List<Object> get props => [];
}

class PayoutTransactionInitial extends PayoutTransactionState {}

class PayoutTransactionLoading extends PayoutTransactionState {}

class PayoutTransactionFailed extends PayoutTransactionState {
  final String message;
  PayoutTransactionFailed({required this.message});
}

class PayoutTransactionSuccessful extends PayoutTransactionState {
  final dynamic response;

  PayoutTransactionSuccessful({required this.response});
}
