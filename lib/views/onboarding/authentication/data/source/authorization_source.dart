import 'package:client/views/onboarding/authentication/data/model/login_response_model.dart';
import 'package:client/views/onboarding/authentication/data/model/register_response.dart';
import 'package:client/views/onboarding/authentication/data/service/authorization_services.dart';
import 'package:client/views/onboarding/authentication/domain/entities/login_entity.dart';
import 'package:client/views/onboarding/authentication/domain/entities/register_entity.dart';

abstract class AuthorizationSources {
  Future<LoginResponseModel> loginUser(LoginEntity loginEntity);
  Future<RegisterResponseModel> registerUser(RegisterEntity registerEntity);
}

class AuthorizationSourcesImpl implements AuthorizationSources {
  final AuthorizationService _authorizationService;

  AuthorizationSourcesImpl({required AuthorizationService authorizationService})
      : _authorizationService = authorizationService;

  @override
  Future<LoginResponseModel> loginUser(LoginEntity loginEntity) =>
      _authorizationService.login(loginEntity);

  @override
  Future<RegisterResponseModel> registerUser(RegisterEntity registerEntity) =>
      _authorizationService.register(registerEntity);
}
