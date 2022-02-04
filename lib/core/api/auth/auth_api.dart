import 'package:client/core/helper/configs/instances.dart';
import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';
import 'package:client/views/onboarding/data/model/auth/auth_response/auth_response.dart';
import 'package:client/views/onboarding/data/model/auth/verification_pin_request_response/verification_pin_request_response.dart';
import 'package:client/views/onboarding/domain/entity/auth/auth_entity.dart';
import 'package:client/views/onboarding/domain/entity/auth/forgot_password_entity.dart';
import 'package:client/views/onboarding/domain/entity/auth/pin_entity.dart';
import 'package:client/views/onboarding/domain/entity/auth/reset_password_entity.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

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

  Future<AuthResponse> socialAuthentication(AuthEntity entity) async {
    try {
      final _response = await _googleSignIn.signIn();
      logger.d(_response?.email);
      return AuthResponse();
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

  Future<AuthResponse> forgotPassword(ForgotPasswordEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.forgotPassword, RequestMethod.post,
          data: entity.toMap());
      return AuthResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> resetPassword(ResetPasswordEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.resetPassword, RequestMethod.post,
          data: entity.toMap());
      return AuthResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> verificationPinRequest() async {
    try {
      final _response = await _networkService.call(
          UrlConfig.verificationPinRequest, RequestMethod.get);
      return AuthResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> verificationPinConfirm(PinEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.verificationPinConfirm, RequestMethod.post,
          data: entity.toJson());
      return AuthResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }
}
