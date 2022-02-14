import 'package:client/core/entity/default_response.dart';
import 'package:client/core/error/failures.dart';
import 'package:client/views/review/data/model/review_list_response_model/revie_list_response_model.dart';
import 'package:client/views/review/domain/entity/review_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ReviewContract {
  Future<Either<Failure, RevieListResponseModel>> reviewList(
      ReviewEntity entity);
  Future<Either<Failure, DefaultResponse>> reviewSave(
      ReviewEntity entity);
}