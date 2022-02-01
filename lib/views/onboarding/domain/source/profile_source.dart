import 'package:client/core/entity/default_response.dart';
import 'package:client/views/onboarding/domain/entity/profile/profile_entity.dart';

abstract class ProfileSource {
  Future<DefaultResponse> profileBioUpdate(ProfileEntity entity);
  Future<DefaultResponse> profileLocationUpdate(ProfileEntity entity);
  Future<DefaultResponse> profileAvatarUpdate(ProfileEntity entity);
}
