import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final int? userId;
  final int? gigId;
  // final String? comments;
  // final int? ratings;

  ReviewEntity({this.userId, this.gigId});
  @override
  List<Object?> get props => [];

  Map<String, dynamic> review() {
    return {
      'user_id': userId,
      'gig_id': gigId,
      // 'comment': comments,
      // 'rating': ratings
    };
  }
}
