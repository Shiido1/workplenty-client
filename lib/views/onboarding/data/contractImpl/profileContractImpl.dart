import 'package:client/core/error/failures.dart';
import 'package:client/views/onboarding/data/model/profile_update_response/profile_update_response.dart';
import 'package:client/views/onboarding/data/sourceImpl/profileSourceImpl.dart';
import 'package:client/views/onboarding/domain/contract/profile_contract.dart';
import 'package:dartz/dartz.dart';

class ProfileContractImpl implements ProfileContract {
  final ProfileSourceImpl _impl;

  ProfileContractImpl(this._impl);

  @override
  Future<Either<Failure, ProfileUpdateResponse>> profileAvatarUpdate(
      entity) async {
    try {
      final _response = await _impl.profileAvatarUpdate(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileUpdateResponse>> profileBioUpdate(
      entity) async {
    try {
      final _response = await _impl.profileBioUpdate(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileUpdateResponse>> profileLocationUpdate(
      entity) async {
    try {
      final _response = await _impl.profileLocationUpdate(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
