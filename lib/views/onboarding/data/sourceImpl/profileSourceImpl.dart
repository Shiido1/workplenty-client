import 'package:client/core/api/profile/profile_api.dart';
import 'package:client/views/onboarding/data/model/profile_update_response/profile_update_response.dart';
import 'package:client/views/onboarding/domain/entity/profile/profile_entity.dart';
import 'package:client/views/onboarding/domain/source/profile_source.dart';

class ProfileSourceImpl implements ProfileSource {
  final ProfileApi _api;

  ProfileSourceImpl({required ProfileApi api}) : _api = api;

  @override
  Future<ProfileUpdateResponse> profileAvatarUpdate(
      ProfileEntity entity) async {
    return await _api.profileAvatarUpdate(entity);
  }

  @override
  Future<ProfileUpdateResponse> profileBioUpdate(ProfileEntity entity) async {
    return await _api.profileBioUpdate(entity);
  }

  @override
  Future<ProfileUpdateResponse> profileLocationUpdate(
      ProfileEntity entity) async {
    return await _api.profileLocationUpdate(entity);
  }
}
