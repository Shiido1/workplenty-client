import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';
import 'package:client/views/onboarding/authentication/data/model/login_response_model.dart';
import 'package:client/views/onboarding/authentication/data/model/register_response.dart';
import 'package:client/views/onboarding/authentication/domain/entities/login_entity.dart';
import 'package:client/views/onboarding/authentication/domain/entities/register_entity.dart';

class AuthorizationService {
  final NetworkService _networkService;

  AuthorizationService({required NetworkService networkService})
      : _networkService = networkService;

  
  Future<LoginResponseModel> login(LoginEntity loginEntity) async {
    try {
      final response = await _networkService.call(
          UrlConfig.login, RequestMethod.post,
          data: loginEntity.toJson());
      return LoginResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<RegisterResponseModel> register(RegisterEntity registerEntity) async {
    try {
      final response = await _networkService.call(
          UrlConfig.register, RequestMethod.post,
          data: registerEntity.toJson());
      return RegisterResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
