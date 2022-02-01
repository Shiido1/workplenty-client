import 'package:client/core/entity/default_response.dart';
import 'package:client/core/helper/configs/instances.dart';
import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';
import 'package:client/views/onboarding/data/model/profile_update_response/profile_update_response.dart';
import 'package:client/views/onboarding/domain/entity/profile/profile_entity.dart';
import 'package:dio/dio.dart';

class ProfileApi {
  final NetworkService _networkService;

  ProfileApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<DefaultResponse> profileBioUpdate(ProfileEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.profileBioUpdate, RequestMethod.post,
          data: entity.toMap());
      return DefaultResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<DefaultResponse> profileLocationUpdate(ProfileEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.profileLocationUpdate, RequestMethod.post,
          data: entity.toLocation());
      return DefaultResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<DefaultResponse> profileAvatarUpdate(ProfileEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.profileAvatarUpdate, RequestMethod.upload,
          formData: FormData.fromMap(entity.toAvatar()));
      logger.d(_response.data);
      return DefaultResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }
}
