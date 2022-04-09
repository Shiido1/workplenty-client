import 'package:client/views/onboarding/data/model/auth/auth_response/auth_response.dart';
import 'package:client/views/onboarding/domain/entity/auth/auth_entity.dart';

abstract class AuthSource {
  Future<AuthResponse> socialAuthentication(AuthEntity entity);
  Future<AuthResponse> login(AuthEntity entity);
  Future<AuthResponse> register(AuthEntity entity);
  Future<AuthResponse> forgotPassword(AuthEntity entity);
  Future<AuthResponse> resetPassword(AuthEntity entity);
  Future<AuthResponse> verificationPinRequest();
  Future<AuthResponse> verificationPinConfirm(AuthEntity entity);
}
