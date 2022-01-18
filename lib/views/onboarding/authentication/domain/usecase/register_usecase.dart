import 'package:client/core/error/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/onboarding/authentication/data/model/register_response.dart';
import 'package:client/views/onboarding/authentication/data/repo/authorization_repo.dart';
import 'package:client/views/onboarding/authentication/domain/entities/register_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class RegisterUseCase implements UseCase<RegisterEntity, Params> {
  final AuthorizationRepositoryImpl repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, RegisterResponseModel>> call(Params params) async {
    return await repository.register(params.register!);
  }
}

class Params extends Equatable {
  final RegisterEntity? register;

  const Params({@required this.register});

  @override
  List<Object> get props => [register!];
}