import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';
import 'package:client/views/onboarding/data/model/auth/auth_response/auth_response.dart';
import 'package:client/views/onboarding/domain/entity/auth/forgot_password_entity.dart';
import 'package:client/views/onboarding/domain/entity/auth/auth_entity.dart';
import 'package:client/views/onboarding/domain/entity/auth/pin_entity.dart';
import 'package:client/views/onboarding/domain/entity/auth/reset_password_entity.dart';

class AuthApi {
  final NetworkService _networkService;

  AuthApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<AuthResponse> login(AuthEntity entity) async {
    try {
      final _response = await _networkService
          .call(UrlConfig.login, RequestMethod.post, data: entity.toLogin());
      return AuthResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> register(AuthEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.register, RequestMethod.post,
          data: entity.toRegister());
      return AuthResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> forgotPassword(ForgotPasswordEntity entity) async {
    try {
      await _networkService.call(UrlConfig.forgotPassword, RequestMethod.post,
          data: entity.toMap());
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> resetPassword(ResetPasswordEntity entity) async {
    try {
      await _networkService.call(UrlConfig.resetPassword, RequestMethod.post,
          data: entity.toMap());
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> verificationPinRequest() async {
    try {
      await _networkService.call(
          UrlConfig.verificationPinRequest, RequestMethod.get);
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> verificationPinConfirm(PinEntity entity) async {
    try {
      await _networkService.call(
          UrlConfig.verificationPinConfirm, RequestMethod.post,
          data: entity.toJson());
      return;
    } catch (e) {
      rethrow;
    }
  }
}
