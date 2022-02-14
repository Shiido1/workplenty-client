import 'package:client/core/entity/default_response.dart';
import 'package:client/core/error/failures.dart';
import 'package:client/views/review/data/model/review_list_response_model/revie_list_response_model.dart';
import 'package:client/views/review/data/source/fetch_industry_source_impl.dart';
import 'package:client/views/review/domain/contract/review_contract.dart';
import 'package:client/views/review/domain/entity/review_entity.dart';
import 'package:dartz/dartz.dart';

class ReviewContractImpl implements ReviewContract {
  final ReviewSourceImpl _impl;

  ReviewContractImpl(this._impl);

  @override
  Future<Either<Failure, RevieListResponseModel>> reviewList(entity) async {
    try {
      final _response = await _impl.reviewList(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DefaultResponse>> reviewSave(ReviewEntity entity) async {
    try {
      final _response = await _impl.reviewSave(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }


}
