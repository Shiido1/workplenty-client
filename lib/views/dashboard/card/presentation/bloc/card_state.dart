part of 'card_bloc.dart';

abstract class CardState extends Equatable {
  const CardState();

  @override
  List<Object> get props => [];
}

class CardInitialState extends CardState {}

class CardLoadingState extends CardState {}

class CardFailedState extends CardState {
  final String message;

  CardFailedState({required this.message});
}

class CardSuccessState extends CardState {
  final dynamic response;
  CardSuccessState({required this.response});
}

class CardRemoveSuccessState extends CardState {
  final dynamic response;
  CardRemoveSuccessState({required this.response});
}
