part of 'payment_deposit_bloc_bloc.dart';

abstract class PaymentDepositBlocEvent extends Equatable {
  const PaymentDepositBlocEvent();

  @override
  List<Object> get props => [];
}

class PaymentDepositEvent extends PaymentDepositBlocEvent {
  final DepositEntity entity;

  const PaymentDepositEvent(this.entity);
}
