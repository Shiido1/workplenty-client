import 'package:client/views/onboarding/data/model/auth/forgot_password_response/forgot_password_response.dart';
import 'package:client/views/onboarding/data/model/auth/login_response/login_response.dart';
import 'package:client/views/onboarding/data/model/auth/register_response/register_response.dart';
import 'package:client/views/onboarding/data/model/auth/verification_pin_request_confirm_response/verification_pin_request_confirm_response.dart';
import 'package:client/views/onboarding/data/model/auth/verification_pin_request_response/verification_pin_request_response.dart';
import 'package:client/views/onboarding/domain/entity/auth/forgot_password_entity.dart';
import 'package:client/views/onboarding/domain/entity/auth/login_entity.dart';
import 'package:client/views/onboarding/domain/entity/auth/pin_entity.dart';
import 'package:client/views/onboarding/domain/entity/auth/register_entity.dart';

abstract class AuthSource {
  Future<LoginResponse> login(LoginEntity entity);
  Future<RegisterResponse> register(RegisterEntity entity);
  Future<ForgotPasswordResponse> forgotPassword(ForgotPasswordEntity entity);
  Future<VerificationPinRequestResponse> verificationPinRequest();
  Future<VerificationPinConfirmResponse> verificationPinConfirm(
      PinEntity entity);
}
