import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';
import 'package:client/views/onboarding/domain/entity/profile/profile_entity.dart';

class ProfileApi {
  final NetworkService _networkService;

  ProfileApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<dynamic> profileBioUpdate(ProfileEntity entity) async {
    try {
      await _networkService
          .call(UrlConfig.profileBioUpdate, RequestMethod.post, data: {});
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> profileLocationUpdate(ProfileEntity entity) async {
    try {
      await _networkService
          .call(UrlConfig.profileLocationUpdate, RequestMethod.post, data: {});
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> profileAvatarUpdate(ProfileEntity entity) async {
    try {
      await _networkService
          .call(UrlConfig.profileAvatarUpdate, RequestMethod.post, data: {});
      return;
    } catch (e) {
      rethrow;
    }
  }
}
