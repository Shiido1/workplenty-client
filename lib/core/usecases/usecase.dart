import 'package:client/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

//? General Application UseCases

class UseCase<Type, Params> {
  Future<Either<Failure, Type>>? call(Params params) {}
  Future<Either<Failure, Type>>? registerUseCase(Params params) {}
  Future<Either<Failure, Type>>? loginUseCase(Params params) {}
  Future<Either<Failure, Type>>? forgotPasswordUseCase(Params params) {}
  Future<Either<Failure, Type>>? resetPasswordUseCase(Params params) {}
  Future<Either<Failure, Type>>? requestVerificationPinUseCase(Params params) {}
  Future<Either<Failure, Type>>? pinVerificationConfirmation(Params params) {}
  Future<Either<Failure, Type>>? updateProfileBio(Params params) {}
  Future<Either<Failure, Type>>? updateLocationBio(Params params) {}
  Future<Either<Failure, Type>>? updateAvatarBio(Params params) {}
  Future<Either<Failure, Type>>? saveGigUseCase(Params params) {}
  Future<Either<Failure, Type>>? getAllCardUseCase() {}
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
