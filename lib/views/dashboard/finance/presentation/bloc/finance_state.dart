part of 'finance_bloc.dart';

abstract class FinanceState extends Equatable {
  const FinanceState();
  
  @override
  List<Object> get props => [];
}

class FinanceInitial extends FinanceState {}
