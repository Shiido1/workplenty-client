import 'package:client/core/database/hive_database.dart';
import 'package:client/core/network/network_service.dart';
import 'package:client/views/onboarding/authentication/data/repo/authorization_repo.dart';
import 'package:client/views/onboarding/authentication/data/service/authorization_services.dart';
import 'package:client/views/onboarding/authentication/data/source/authorization_source.dart';
import 'package:client/views/onboarding/authentication/domain/usecase/login_usecase.dart';
import 'package:client/views/onboarding/authentication/domain/usecase/register_usecase.dart';
import 'package:client/views/onboarding/authentication/presentation/login/bloc/login_bloc.dart';
import 'package:client/views/onboarding/authentication/presentation/register/bloc/register_bloc.dart';
import 'package:get_it/get_it.dart';
import '../network/app_config.dart';
import '../database/session_manager.dart';

final inject = GetIt.instance;
final sessionManager = SessionManager();
final hiveManager = HiveManager();

Future<void> initializeCore({required Environment environment}) async {
  AppConfig.environment = environment;
  await _initializeCore();
  _initServices();
  _initProviders();
  _initBloc();
  _initDataSources();
  _initDataRepositories();
  _initializeUsecase();
}

/// Initialize the core functions here
Future<void> _initializeCore() async {
  await hiveManager.initializeDatabase();
  await sessionManager.initializeSession();
  inject.registerLazySingleton<HiveManager>(() => hiveManager);
  inject.registerLazySingleton<SessionManager>(() => sessionManager);
}

/// Initialize providers here
void _initProviders() {}

/// Initialize bloc's here
void _initBloc() {
  inject.registerLazySingleton<LoginBloc>(() => LoginBloc(inject()));
  inject.registerLazySingleton<RegisterBloc>(() => RegisterBloc(inject()));
}

/// Initialize data sources implementations
void _initDataSources() {
  inject.registerLazySingleton<AuthorizationSourcesImpl>(
      () => AuthorizationSourcesImpl(authorizationService: inject()));
}

/// Initialize data repositories implementations
void _initDataRepositories() {
  inject.registerLazySingleton<AuthorizationRepositoryImpl>(
      () => AuthorizationRepositoryImpl(inject()));
}

/// Initialize services's here
void _initServices() {
  
  inject.registerLazySingleton<NetworkService>(
      () => NetworkService(baseUrl: AppConfig.coreBaseUrl));
  inject.registerLazySingleton<AuthorizationService>(
      () => AuthorizationService(networkService: inject()));
}

/// Initialize usecases here
void _initializeUsecase() {
  inject.registerLazySingleton<LoginUseCase>(() => LoginUseCase(inject()));
  inject.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(inject()));
  }
