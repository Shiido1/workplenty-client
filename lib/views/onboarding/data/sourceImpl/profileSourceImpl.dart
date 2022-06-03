import 'package:client/core/api/profile/profile_api.dart';
import 'package:client/core/entity/default_response.dart';
import 'package:client/views/onboarding/data/model/location_response/location_response.dart';
import 'package:client/views/onboarding/domain/entity/profile/profile_entity.dart';
import 'package:client/views/onboarding/domain/source/profile_source.dart';

import '../../../../core/entity/user/user.dart';

class ProfileSourceImpl implements ProfileSource {
  final ProfileApi _api;

  ProfileSourceImpl({required ProfileApi api}) : _api = api;

  @override
  Future<DefaultResponse> profileAvatarUpdate(ProfileEntity entity) async {
    return await _api.profileAvatarUpdate(entity);
  }

  @override
  Future<DefaultResponse> profileBioUpdate(ProfileEntity entity) async {
    return await _api.profileBioUpdate(entity);
  }

  @override
  Future<DefaultResponse> profileLocationUpdate(ProfileEntity entity) async {
    return await _api.profileLocationUpdate(entity);
  }

  @override
  Future<User> profileInfo() async => await _api.profileInfo();

  @override
  Future<LocationResponse> countries() async {
    return await _api.getListOfCountries();
  }

  @override
  Future<LocationResponse> states(int entity) async {
    return await _api.getListOfStates(entity);
  }

  @override
  Future<DefaultResponse> updateAccount(ProfileEntity entity) async =>
      await _api.updateAccount(entity);
}
