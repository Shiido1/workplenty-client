part of 'review_bloc_bloc.dart';

abstract class ReviewBlocState extends Equatable {
  const ReviewBlocState();
  
  @override
  List<Object> get props => [];
}

class ReviewBlocInitial extends ReviewBlocState {}

class ReviewBlocLoading extends ReviewBlocState {}

class ReviewBlocFailed extends ReviewBlocState {
  final String message;
  ReviewBlocFailed({required this.message});
}

class ReviewBlocSuccess extends ReviewBlocState {
  final dynamic response;
  ReviewBlocSuccess({required this.response});
}
