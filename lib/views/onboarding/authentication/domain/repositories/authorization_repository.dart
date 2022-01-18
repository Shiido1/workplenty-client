import 'package:client/core/error/failures.dart';
import 'package:client/views/onboarding/authentication/data/model/login_response_model.dart';
import 'package:client/views/onboarding/authentication/data/model/register_response.dart';
import 'package:client/views/onboarding/authentication/domain/entities/login_entity.dart';
import 'package:client/views/onboarding/authentication/domain/entities/register_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthorizationRepository{
    Future<Either<Failure, LoginResponseModel>> login(LoginEntity loginEntity);
    Future<Either<Failure, RegisterResponseModel>> register(RegisterEntity registerEntity);

}