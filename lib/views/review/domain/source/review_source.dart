import 'package:client/core/entity/default_response.dart';
import 'package:client/views/review/data/model/review_list_response_model/revie_list_response_model.dart';
import 'package:client/views/review/domain/entity/review_entity.dart';

abstract class ReviewSource {
  Future<RevieListResponseModel> reviewList(ReviewEntity entity);
  Future<DefaultResponse> reviewSave(ReviewEntity entity);
}