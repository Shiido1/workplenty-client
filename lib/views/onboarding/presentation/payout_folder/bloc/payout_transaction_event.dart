part of 'payout_transaction_bloc.dart';

abstract class PayoutTransactionEvent extends Equatable {
  const PayoutTransactionEvent();

  @override
  List<Object> get props => [];
}

class StartPayoutTransactionEvent extends PayoutTransactionEvent {
  final PayoutEntity entity;

  StartPayoutTransactionEvent(this.entity);
}
