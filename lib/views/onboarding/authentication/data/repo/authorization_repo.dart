import 'package:client/core/database/session_manager.dart';
import 'package:client/views/onboarding/authentication/data/model/register_response.dart';
import 'package:client/views/onboarding/authentication/data/source/authorization_source.dart';
import 'package:client/views/onboarding/authentication/domain/entities/login_entity.dart';
import 'package:client/views/onboarding/authentication/data/model/login_response_model.dart';
import 'package:client/core/error/failures.dart';
import 'package:client/views/onboarding/authentication/domain/entities/register_entity.dart';
import 'package:client/views/onboarding/authentication/domain/repositories/authorization_repository.dart';
import 'package:dartz/dartz.dart';

class AuthorizationRepositoryImpl implements AuthorizationRepository {
  final AuthorizationSourcesImpl? authorizationSources;

  AuthorizationRepositoryImpl(this.authorizationSources);

  @override
  Future<Either<Failure, LoginResponseModel>> login(
      LoginEntity loginEntity) async {
    return await _loginUser(loginEntity);
  }

  Future<Either<Failure, LoginResponseModel>> _loginUser(
      LoginEntity loginEntity) async {
    try {
      final _login = await authorizationSources!.loginUser(loginEntity);

      /// Cache users information here
      SessionManager.instance.isLoggedIn = true;
      SessionManager.instance.authToken = _login.data!.token!;
      SessionManager.instance.userId = _login.data!.user!.id!;
      SessionManager.instance.usersData = _login.data!.toJson();

      return Right(_login);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RegisterResponseModel>> register(
      RegisterEntity registerEntity) async {
    return await _registerUser(registerEntity);
  }

  Future<Either<Failure, RegisterResponseModel>> _registerUser(
      RegisterEntity registerEntity) async {
    try {
      final _register =
          await authorizationSources!.registerUser(registerEntity);
          
      SessionManager.instance.isLoggedIn = true;
      SessionManager.instance.authToken = _register.data!.token!;
      SessionManager.instance.usersData = _register.data!.toJson();
      return Right(_register);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
