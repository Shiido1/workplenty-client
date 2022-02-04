import 'package:client/core/error/failures.dart';
import 'package:client/views/onboarding/data/model/auth/auth_response/auth_response.dart';
import 'package:client/views/onboarding/data/model/auth/forgot_password_response/forgot_password_response.dart';
import 'package:client/views/onboarding/domain/entity/auth/auth_entity.dart';
import 'package:client/views/onboarding/domain/entity/auth/forgot_password_entity.dart';
import 'package:client/views/onboarding/domain/entity/auth/pin_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthContract {
  Future<Either<Failure, AuthResponse>> socialAuthentication(AuthEntity entity);
  Future<Either<Failure, AuthResponse>> login(AuthEntity entity);
  Future<Either<Failure, AuthResponse>> register(AuthEntity entity);
  Future<Either<Failure, AuthResponse>> forgotPassword(
      ForgotPasswordEntity entity);
  Future<Either<Failure, AuthResponse>> verificationPinRequest();
  Future<Either<Failure, AuthResponse>> verificationPinConfirm(
      PinEntity entity);
}
