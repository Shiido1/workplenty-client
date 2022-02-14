part of 'saved_profile_bloc_bloc.dart';

abstract class SavedProfileBlocEvent extends Equatable {
  const SavedProfileBlocEvent();

  @override
  List<Object> get props => [];
}

class SavedProfileEvent extends SavedProfileBlocEvent {
  final SavedProfileEntity entity;

  const SavedProfileEvent(this.entity);
}
