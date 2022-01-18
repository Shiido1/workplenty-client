import 'package:client/core/error/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/onboarding/authentication/data/model/login_response_model.dart';
import 'package:client/views/onboarding/authentication/data/repo/authorization_repo.dart';
import 'package:client/views/onboarding/authentication/domain/entities/login_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LoginUseCase implements UseCase<LoginEntity, Params> {
  final AuthorizationRepositoryImpl repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, LoginResponseModel>> call(Params params) async {
    return await repository.login(params.login!);
  }
}

class Params extends Equatable {
  final LoginEntity? login;

  const Params({@required this.login});

  @override
  List<Object> get props => [login!];
}
