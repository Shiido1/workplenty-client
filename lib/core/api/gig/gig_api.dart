import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';
import 'package:client/views/dashboard/gig/data/model/save_gig_response/save_gig_response.dart';
import 'package:client/views/dashboard/gig/domain/entity/gig/gig_entity.dart';

class GigApi {
  final NetworkService _networkService;

  GigApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<SaveGigResponse> saveGig(GigEntity entity) async {
    try {
      final _response = await _networkService
          .call(UrlConfig.saveGig, RequestMethod.post, data: {});
      return SaveGigResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> removeAttachment(GigEntity entity) async {
    try {
      await _networkService
          .call(UrlConfig.removeAttachment, RequestMethod.post, data: {});
      return;
    } catch (e) {
      rethrow;
    }
  }
}
