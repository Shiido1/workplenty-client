import 'package:client/core/database/session_manager.dart';
import 'package:client/core/error/failures.dart';
import 'package:client/core/helper/configs/instances.dart';
import 'package:client/views/onboarding/data/model/auth/auth_response/auth_response.dart';
import 'package:client/views/onboarding/data/sourceImpl/authSourceImpl.dart';
import 'package:client/views/onboarding/domain/contract/auth_contract.dart';
import 'package:client/views/onboarding/domain/entity/auth/auth_entity.dart';
import 'package:dartz/dartz.dart';

class AuthContractImpl implements AuthContract {
  final AuthSourceImpl _impl;

  AuthContractImpl(this._impl);

  @override
  Future<Either<Failure, AuthResponse>> forgotPassword(entity) async {
    try {
      final _response = await _impl.forgotPassword(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> resetPassword(entity) async {
    try {
      final _response = await _impl.resetPassword(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> login(entity) async {
    try {
      final _response = await _impl.login(entity);
      SessionManager.instance.usersData = _response.data?.user?.toJson();
      SessionManager.instance.authTokenType = _response.data?.tokenType ?? '';
      SessionManager.instance.authToken = _response.data?.token ?? '';
      SessionManager.instance.isLoggedIn = true;
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> register(entity) async {
    try {
      final _response = await _impl.register(entity);
      SessionManager.instance.usersData = _response.data?.user?.toJson();
      SessionManager.instance.authTokenType = _response.data?.tokenType ?? '';
      SessionManager.instance.authToken = _response.data?.token ?? '';
      SessionManager.instance.isLoggedIn = true;
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> verificationPinConfirm(entity) async {
    try {
      final _response = await _impl.verificationPinConfirm(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> verificationPinRequest() async {
    try {
      final _response = await _impl.verificationPinRequest();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> googleAuth() async {
    try {
      final _response = await _impl.googleAuth();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> facebookAuth() async {
    try {
      final _response = await _impl.facebookAuth();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
