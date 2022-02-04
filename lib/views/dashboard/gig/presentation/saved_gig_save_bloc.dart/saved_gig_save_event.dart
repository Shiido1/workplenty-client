part of 'saved_gig_save_bloc.dart';

abstract class SavedGigSaveEvent extends Equatable {
  const SavedGigSaveEvent();

  @override
  List<Object> get props => [];
}

class StartSavedGigSaveEvent extends SavedGigSaveEvent {
  final SavedGigSaveEntity entity;

  const StartSavedGigSaveEvent(this.entity);
}
