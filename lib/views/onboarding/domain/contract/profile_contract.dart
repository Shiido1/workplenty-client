import 'package:client/core/entity/default_response.dart';
import 'package:client/core/entity/user/user.dart';
import 'package:client/core/error/failures.dart';
import 'package:client/views/onboarding/data/model/location_response/location_response.dart';
import 'package:client/views/onboarding/domain/entity/address/address_entity.dart';
import 'package:client/views/onboarding/domain/entity/profile/profile_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileContract {
  Future<Either<Failure, DefaultResponse>> profileBioUpdate(
      ProfileEntity entity);
  Future<Either<Failure, DefaultResponse>> profileLocationUpdate(
      ProfileEntity entity);
  Future<Either<Failure, DefaultResponse>> profileAvatarUpdate(
      ProfileEntity entity);
  Future<Either<Failure, LocationResponse>> countries();
  Future<Either<Failure, LocationResponse>> state(int id);
  Future<Either<Failure, LocationResponse>> cities(int id);
  Future<Either<Failure, DefaultResponse>> updateAccount(ProfileEntity entity);
  Future<Either<Failure, DefaultResponse>> updateAddress(AddressEntity entity);
  Future<Either<Failure, User>> profileInfo();
}
