part of 'saveGig_bloc.dart';

abstract class SaveGigEvent extends Equatable {
  const SaveGigEvent();

  @override
  List<Object> get props => [];
}

class StartSaveGigEvent extends SaveGigEvent {
  final GigEntity entity;

  const StartSaveGigEvent(this.entity);
}
