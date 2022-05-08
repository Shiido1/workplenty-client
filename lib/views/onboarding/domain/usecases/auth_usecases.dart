import 'package:client/core/error/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/onboarding/data/contractImpl/authContractImpl.dart';
import 'package:client/views/onboarding/data/model/auth/auth_response/auth_response.dart';
import 'package:client/views/onboarding/domain/entity/auth/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AuthUsesCases extends UseCase<AuthEntity, Params> {
  final AuthContractImpl _repository;

  AuthUsesCases(this._repository);

  @override
  Future<Either<Failure, AuthResponse>> registerUseCase(Params params) async =>
      await _repository.register(params.entity!);

  @override
  Future<Either<Failure, AuthResponse>> loginUseCase(Params params) async =>
      await _repository.login(params.entity!);

  @override
  Future<Either<Failure, AuthResponse>>? googleAuth() async =>
      await _repository.googleAuth();

  @override
  Future<Either<Failure, AuthResponse>>? facebookAuth() async =>
      await _repository.facebookAuth();

  @override
  Future<Either<Failure, AuthResponse>>? forgotPasswordUseCase(
          Params params) async =>
      await _repository.forgotPassword(params.entity!);

  @override
  Future<Either<Failure, AuthResponse>>? pinVerificationConfirmation(
          Params params) async =>
      await _repository.verificationPinConfirm(params.entity!);

  @override
  Future<Either<Failure, AuthEntity>>? requestVerificationPinUseCase() async =>
      await _repository.verificationPinRequest();

  @override
  Future<Either<Failure, AuthEntity>>? resetPasswordUseCase(
          Params params) async =>
      await _repository.resetPassword(params.entity!);
}

class Params extends Equatable {
  final AuthEntity? entity;

  const Params({required this.entity});

  @override
  List<Object> get props => [entity!];
}
