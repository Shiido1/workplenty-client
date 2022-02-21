import 'package:client/core/api/review/review_api.dart';
import 'package:client/core/entity/default_response.dart';
import 'package:client/views/review/data/model/review_list_response_model/revie_list_response_model.dart';
import 'package:client/views/review/domain/entity/review_entity.dart';
import 'package:client/views/review/domain/source/review_source.dart';

class ReviewSourceImpl implements ReviewSource {
  final ReviewApi _api;

  ReviewSourceImpl({required ReviewApi api}) : _api = api;

  @override
  Future<RevieListResponseModel> reviewList(ReviewEntity entity) async {
    return await _api.reviewGig(entity);
  }

  @override
  Future<DefaultResponse> reviewSave(ReviewEntity entity) async {
    return await _api.saveReview(entity);
  }
}
