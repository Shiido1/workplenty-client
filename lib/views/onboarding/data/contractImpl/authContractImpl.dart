import 'package:client/core/error/failures.dart';
import 'package:client/views/onboarding/data/model/auth/auth_response/auth_response.dart';
import 'package:client/views/onboarding/data/model/auth/forgot_password_response/forgot_password_response.dart';
import 'package:client/views/onboarding/data/model/auth/verification_pin_request_confirm_response/verification_pin_request_confirm_response.dart';
import 'package:client/views/onboarding/data/model/auth/verification_pin_request_response/verification_pin_request_response.dart';
import 'package:client/views/onboarding/data/sourceImpl/authSourceImpl.dart';
import 'package:client/views/onboarding/domain/contract/auth_contract.dart';
import 'package:dartz/dartz.dart';

class AuthContractImpl implements AuthContract {
  final AuthSourceImpl _impl;

  AuthContractImpl(this._impl);

  @override
  Future<Either<Failure, ForgotPasswordResponse>> forgotPassword(entity) async {
    try {
      final _response = await _impl.forgotPassword(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> login(entity) async {
    try {
      final _response = await _impl.login(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> register(entity) async {
    try {
      final _response = await _impl.register(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, VerificationPinConfirmResponse>>
      verificationPinConfirm(entity) async {
    try {
      final _response = await _impl.verificationPinConfirm(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, VerificationPinRequestResponse>>
      verificationPinRequest() async {
    try {
      final _response = await _impl.verificationPinRequest();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
