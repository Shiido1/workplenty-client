part of 'payment_deposit_bloc_bloc.dart';

abstract class PaymentDepositBlocState extends Equatable {
  const PaymentDepositBlocState();

  @override
  List<Object> get props => [];
}

class PaymentDepositBlocInitial extends PaymentDepositBlocState {}

class PaymentDepositBlocLoading extends PaymentDepositBlocState {}

class PaymentDepositBlocFailed extends PaymentDepositBlocState {
  final String message;
  PaymentDepositBlocFailed({required this.message});
}

class PaymentDepositBlocSuccess extends PaymentDepositBlocState {
  final dynamic response;
  PaymentDepositBlocSuccess({required this.response});
}
