part of 'saveGig_bloc.dart';

abstract class SaveGigState extends Equatable {
  const SaveGigState();

  @override
  List<Object> get props => [];
}

class SaveGigblocInitial extends SaveGigState {}

class SaveGigblocLoading extends SaveGigState {}

class SaveGigblocFailed extends SaveGigState {
  final String message;
  SaveGigblocFailed({required this.message});
}

class SaveGigblocSuccess extends SaveGigState {
  final dynamic response;
  SaveGigblocSuccess({required this.response});
}
