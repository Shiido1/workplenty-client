import 'package:client/core/api/auth/auth_api.dart';
import 'package:client/views/onboarding/data/model/auth/forgot_password_response/forgot_password_response.dart';
import 'package:client/views/onboarding/data/model/auth/login_response/login_response.dart';
import 'package:client/views/onboarding/data/model/auth/register_response/register_response.dart';
import 'package:client/views/onboarding/data/model/auth/verification_pin_request_confirm_response/verification_pin_request_confirm_response.dart';
import 'package:client/views/onboarding/data/model/auth/verification_pin_request_response/verification_pin_request_response.dart';

import 'package:client/views/onboarding/domain/entity/auth/register_entity.dart';
import 'package:client/views/onboarding/domain/entity/auth/login_entity.dart';
import 'package:client/views/onboarding/domain/entity/auth/forgot_password_entity.dart';
import 'package:client/views/onboarding/domain/source/auth_source.dart';

class AuthSourceImpl implements AuthSource {
  final AuthApi _authApi;

  AuthSourceImpl({required AuthApi api}) : _authApi = api;

  @override
  Future<ForgotPasswordResponse> forgotPassword(
      ForgotPasswordEntity entity) async {
    return await _authApi.forgotPassword(entity);
  }

  @override
  Future<LoginResponse> login(LoginEntity entity) async {
    return await _authApi.login(entity);
  }

  @override
  Future<RegisterResponse> register(RegisterEntity entity) async {
    return await _authApi.register(entity);
  }

  @override
  Future<VerificationPinConfirmResponse> verificationPinConfirm(entity) async {
    return await _authApi.verificationPinConfirm(entity);
  }

  @override
  Future<VerificationPinRequestResponse> verificationPinRequest() async {
    return await _authApi.verificationPinRequest();
  }
}