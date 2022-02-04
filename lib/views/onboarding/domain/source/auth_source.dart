import 'package:client/views/onboarding/data/model/auth/auth_response/auth_response.dart';
import 'package:client/views/onboarding/data/model/auth/forgot_password_response/forgot_password_response.dart';
import 'package:client/views/onboarding/data/model/auth/verification_pin_request_response/verification_pin_request_response.dart';
import 'package:client/views/onboarding/domain/entity/auth/forgot_password_entity.dart';
import 'package:client/views/onboarding/domain/entity/auth/auth_entity.dart';
import 'package:client/views/onboarding/domain/entity/auth/pin_entity.dart';

abstract class AuthSource {
  Future<AuthResponse> socialAuthentication(AuthEntity entity);
  Future<AuthResponse> login(AuthEntity entity);
  Future<AuthResponse> register(AuthEntity entity);
  Future<AuthResponse> forgotPassword(ForgotPasswordEntity entity);
  Future<AuthResponse> verificationPinRequest();
  Future<AuthResponse> verificationPinConfirm(
      PinEntity entity);
}
