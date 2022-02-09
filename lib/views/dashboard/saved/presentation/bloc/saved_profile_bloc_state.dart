part of 'saved_profile_bloc_bloc.dart';

abstract class SavedProfileBlocState extends Equatable {
  const SavedProfileBlocState();

  @override
  List<Object> get props => [];
}

class SavedProfileBlocInitial extends SavedProfileBlocState {}

class SavedProfileblocInitial extends SavedProfileBlocState {}

class SavedProfileblocLoading extends SavedProfileBlocState {}

class SavedProfileblocFailed extends SavedProfileBlocState {
  final String message;
  SavedProfileblocFailed({required this.message});
}

class SavedProfileblocSuccess extends SavedProfileBlocState {
  final dynamic response;
  SavedProfileblocSuccess({required this.response});
}
