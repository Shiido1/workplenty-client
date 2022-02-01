import 'package:client/core/error/failures.dart';
import 'package:client/views/onboarding/data/model/profile_update_response/profile_update_response.dart';
import 'package:client/views/onboarding/domain/entity/profile/profile_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileContract {
  Future<Either<Failure, ProfileUpdateResponse>> profileBioUpdate(
      ProfileEntity entity);
  Future<Either<Failure, ProfileUpdateResponse>> profileLocationUpdate(
      ProfileEntity entity);
  Future<Either<Failure, ProfileUpdateResponse>> profileAvatarUpdate(
      ProfileEntity entity);
}
