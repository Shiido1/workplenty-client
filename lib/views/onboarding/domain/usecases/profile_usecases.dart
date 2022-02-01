import 'package:client/core/entity/default_response.dart';
import 'package:client/core/error/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/onboarding/data/contractImpl/profileContractImpl.dart';
import 'package:client/views/onboarding/domain/entity/profile/profile_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ProfileUseCases extends UseCase<DefaultResponse, Params> {
  final ProfileContractImpl _repository;

  ProfileUseCases(this._repository);

  @override
  Future<Either<Failure, DefaultResponse>>? updateProfileBio(
      Params params) async {
    return await _repository.profileBioUpdate(params.entity!);
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
}

class Params extends Equatable {
  final ProfileEntity? entity;

  const Params({required this.entity});

  @override
  List<Object> get props => [entity!];
}
