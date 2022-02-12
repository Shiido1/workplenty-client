import 'package:client/core/entity/default_response.dart';
import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';
import 'package:client/views/review/data/model/review_list_response_model/revie_list_response_model.dart';
import 'package:client/views/review/domain/entity/review_entity.dart';

class ReviewApi {
  final NetworkService _networkService;
  ReviewApi({required NetworkService networkService})
      : _networkService = networkService;

  ///list of review
  Future<RevieListResponseModel> reviewGig(ReviewEntity entity) async {
    try {
      final _response = await _networkService.call(
        UrlConfig.reviewList,
        RequestMethod.get,
        queryParams: {},
      );
      return RevieListResponseModel.fromJson(_response.data);
    } catch (e) {
      throw (e);
    }
  }

  ///save review
  Future<DefaultResponse> saveReview(ReviewEntity entity) async {
    try {
      final _response = await _networkService.call(
        UrlConfig.saveReview,
        RequestMethod.post,
        data: entity,
        queryParams: {},
      );
      return DefaultResponse.fromJson(_response.data);
    } catch (e) {
      throw (e);
    }
  }
}
