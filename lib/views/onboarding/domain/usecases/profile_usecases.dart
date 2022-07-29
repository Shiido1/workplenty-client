import 'package:client/core/entity/default_response.dart';
import 'package:client/core/entity/user/user.dart';
import 'package:client/core/error/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/onboarding/data/contractImpl/profileContractImpl.dart';
import 'package:client/views/onboarding/data/model/location_response/location_response.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ProfileUseCases extends UseCase<dynamic, Params> {
  final ProfileContractImpl _repository;

  ProfileUseCases(this._repository);

  @override
  Future<Either<Failure, DefaultResponse>>? updateProfileBio(
      Params params) async {
    return await _repository.profileBioUpdate(params.entity!);
  }

  @override
  Future<Either<Failure, User>>? profileInfo() async {
    return await _repository.profileInfo();
  }

  @override
  Future<Either<Failure, DefaultResponse>>? updateLocationBio(
      Params params) async {
    return await _repository.profileLocationUpdate(params.entity!);
  }

  @override
  Future<Either<Failure, DefaultResponse>>? updateAvatarBio(
      Params params) async {
    return await _repository.profileAvatarUpdate(params.entity!);
  }

  @override
  Future<Either<Failure, LocationResponse>>? countries() async {
    return await _repository.countries();
  }

  @override
  Future<Either<Failure, LocationResponse>>? states(Params p) async {
    return await _repository.state(p.entity!);
  }

  @override
  Future<Either<Failure, DefaultResponse>>? updateAccount(Params p) async =>
      await _repository.updateAccount(p.entity!);

  @override
  Future<Either<Failure, DefaultResponse>>? updateAddress(Params p) async =>
      await _repository.updateAddress(p.entity!);
}

class Params extends Equatable {
  final dynamic entity;

  const Params({required this.entity});

  @override
  List<Object> get props => [entity!];
}
