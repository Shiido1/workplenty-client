import 'package:client/views/onboarding/data/model/profile_update_response/profile_update_response.dart';
import 'package:client/views/onboarding/domain/entity/profile/profile_entity.dart';

abstract class ProfileSource {
  Future<ProfileUpdateResponse> profileBioUpdate(ProfileEntity entity);
  Future<ProfileUpdateResponse> profileLocationUpdate(ProfileEntity entity);
  Future<ProfileUpdateResponse> profileAvatarUpdate(ProfileEntity entity);
}
