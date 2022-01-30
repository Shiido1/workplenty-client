import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';
import 'package:client/views/onboarding/domain/entity/gig/gig_entity.dart';

class GigApi {
  final NetworkService _networkService;

  GigApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<dynamic> saveGig(GigEntity entity) async {
    try {
      await _networkService
          .call(UrlConfig.saveGig, RequestMethod.post, data: {});
      return;
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
