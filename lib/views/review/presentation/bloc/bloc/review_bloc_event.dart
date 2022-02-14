part of 'review_bloc_bloc.dart';

abstract class ReviewBlocEvent extends Equatable {
  const ReviewBlocEvent();

  @override
  List<Object> get props => [];
}

class SaveReviewEvent extends ReviewBlocEvent {
  final ReviewEntity entity;

  const SaveReviewEvent(this.entity);
}
