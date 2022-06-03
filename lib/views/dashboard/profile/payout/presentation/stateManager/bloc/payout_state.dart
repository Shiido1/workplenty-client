part of 'payout_bloc.dart';

abstract class PayoutState extends Equatable {
  const PayoutState();

  @override
  List<Object> get props => [];
}

class PayoutInitial extends PayoutState {}
