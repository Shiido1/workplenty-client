part of 'saved_gig_save_bloc.dart';

abstract class SavedGigSaveState extends Equatable {
  const SavedGigSaveState();

  @override
  List<Object> get props => [];
}

class SavedGigSaveblocInitial extends SavedGigSaveState {}

class SavedGigSaveblocLoading extends SavedGigSaveState {}

class SavedGigSaveblocFailed extends SavedGigSaveState {
  final String message;
  SavedGigSaveblocFailed({required this.message});
}

class SavedGigSaveblocSuccess extends SavedGigSaveState {
  final dynamic response;
  SavedGigSaveblocSuccess({required this.response});
}
