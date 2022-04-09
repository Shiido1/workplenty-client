import 'package:client/core/entity/default_response.dart';
import 'package:client/core/error/failures.dart';
import 'package:client/views/onboarding/data/model/location_response/location_response.dart';
import 'package:client/views/onboarding/data/sourceImpl/profileSourceImpl.dart';
import 'package:client/views/onboarding/domain/contract/profile_contract.dart';
import 'package:dartz/dartz.dart';

class ProfileContractImpl implements ProfileContract {
  final ProfileSourceImpl _impl;

  ProfileContractImpl(this._impl);

  @override
  Future<Either<Failure, DefaultResponse>> profileAvatarUpdate(entity) async {
    try {
      final _response = await _impl.profileAvatarUpdate(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DefaultResponse>> profileBioUpdate(entity) async {
    try {
      final _response = await _impl.profileBioUpdate(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DefaultResponse>> profileLocationUpdate(entity) async {
    try {
      final _response = await _impl.profileLocationUpdate(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LocationResponse>> countries() async {
    try {
      final _response = await _impl.countries();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LocationResponse>> state(int id) async {
    try {
      final _response = await _impl.states(id);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
