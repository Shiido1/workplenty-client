import 'package:client/core/database/session_manager.dart';
import 'package:client/core/helper/configs/instances.dart';
import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';
import 'package:client/views/onboarding/data/model/auth/auth_response/auth_response.dart';
import 'package:client/views/onboarding/domain/entity/auth/auth_entity.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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

  Future<dynamic> _socialAuth(
      {required String? provider,
      required String? code,
      required String? refCode}) async {
    try {
      final _response = await _networkService.call(
          'social-auth/callback', RequestMethod.post,
          data: {'provider': provider, 'code': code, "ref_code": refCode});
      logger.d(_response.data);
      return AuthResponse();
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> googleAuth() async {
    try {
      final _response = await _googleSignIn.signIn();
      logger.d(_response?.email);
      await _socialAuth(
          refCode: _response!.serverAuthCode,
          provider: 'google',
          code: _response.id);
      return AuthResponse();
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> facebookAuth() async {
    try {
      final _result = await FacebookAuth.i;
      if (_result.accessToken != null) {
        /// TODO: send google auth credentials to server
        return AuthResponse();
      }
      final _login = await _result.login();
      if (_login.status == LoginStatus.success) {
        /// TODO: send facebook auth credentials to server
        return AuthResponse();
      }
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

  Future<AuthResponse> forgotPassword(AuthEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.forgotPassword, RequestMethod.post,
          data: entity.forgotPassword());
      return AuthResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> resetPassword(AuthEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.resetPassword, RequestMethod.post,
          data: entity.resetNewPassword());
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

  Future<AuthResponse> verificationPinConfirm(AuthEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.verificationPinConfirm, RequestMethod.post,
          data: entity.verifyPIN());
      return AuthResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }
}
