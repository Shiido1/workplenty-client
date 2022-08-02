part of 'card_bloc.dart';

abstract class CardEvent extends Equatable {
  const CardEvent();

  @override
  List<Object> get props => [];
}

class StartCardEvent extends CardEvent {
  final CardEntity entity;

  StartCardEvent(this.entity);
}

class StartCardRemoveEvent extends CardEvent {
  final CardEntity entity;

  StartCardRemoveEvent(this.entity);
}
