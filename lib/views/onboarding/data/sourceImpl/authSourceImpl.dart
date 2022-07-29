import 'package:client/core/api/auth/auth_api.dart';
import 'package:client/views/onboarding/data/model/auth/auth_response/auth_response.dart';
import 'package:client/views/onboarding/domain/entity/auth/auth_entity.dart';
import 'package:client/views/onboarding/domain/source/auth_source.dart';

class AuthSourceImpl implements AuthSource {
  final AuthApi _authApi;

  AuthSourceImpl({required AuthApi api}) : _authApi = api;

  @override
  Future<AuthResponse> forgotPassword(AuthEntity entity) async =>
      await _authApi.forgotPassword(entity);

  @override
  Future<AuthResponse> resetPassword(AuthEntity entity) async =>
      await _authApi.resetPassword(entity);

  @override
  Future<AuthResponse> login(AuthEntity entity) async =>
      await _authApi.login(entity);

  @override
  Future<AuthResponse> register(AuthEntity entity) async =>
      await _authApi.register(entity);

  @override
  Future<AuthResponse> verificationPinConfirm(entity) async =>
      await _authApi.verificationPinConfirm(entity);

  @override
  Future<AuthResponse> verificationPinRequest() async =>
      await _authApi.verificationPinRequest();

  @override
  Future<AuthResponse> googleAuth() async => await _authApi.googleAuth();

  @override
  Future<AuthResponse> facebookAuth() async => await _authApi.facebookAuth();
}
