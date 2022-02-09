import 'package:client/core/api/artisan/artisan_api.dart';
import 'package:client/core/api/auth/auth_api.dart';
import 'package:client/core/api/card/card_api.dart';
import 'package:client/core/api/chat/chat_api.dart';
import 'package:client/core/api/gig/gig_api.dart';
import 'package:client/core/database/hive_database.dart';
import 'package:client/core/network/network_service.dart';
import 'package:client/views/dashboard/card/data/contractImpl/cardContractImpl.dart';
import 'package:client/views/dashboard/card/data/sourceImpl/cardSourceImpl.dart';
import 'package:client/views/dashboard/card/domain/usecase/card_usecase.dart';
import 'package:client/views/dashboard/chat/data/contractImpl/chatContractImpl.dart';
import 'package:client/views/dashboard/chat/data/sourceImpl/chatSourceImpl.dart';
import 'package:client/views/dashboard/chat/domain/usecase/chat_usecase.dart';
import 'package:client/views/dashboard/gig/data/contractImpl/artisanContractImpl.dart';
import 'package:client/views/dashboard/gig/data/contractImpl/gigContractImpl.dart';
import 'package:client/views/dashboard/gig/data/sourceImpl/artisanSourceImpl.dart';
import 'package:client/views/dashboard/gig/data/sourceImpl/gigSourceImpl.dart';
import 'package:client/views/dashboard/gig/domain/usecase/artisan_usecase.dart';
import 'package:client/views/dashboard/gig/domain/usecase/gig_usecase.dart';
import 'package:client/views/onboarding/data/contractImpl/authContractImpl.dart';
import 'package:client/views/onboarding/data/sourceImpl/authSourceImpl.dart';
import 'package:client/views/onboarding/domain/usecases/auth_usecases.dart';
import 'package:client/views/onboarding/presentation/authentication/bloc/authbloc_bloc.dart';
import 'package:client/views/onboarding/presentation/screens/services/bloc/servicebloc_bloc.dart';
import 'package:get_it/get_it.dart';

import '../database/session_manager.dart';
import '../network/app_config.dart';

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
  _initDataContracts();
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
  inject.registerLazySingleton<AuthblocBloc>(() => AuthblocBloc(inject()));
  inject
      .registerLazySingleton<ServiceblocBloc>(() => ServiceblocBloc(inject()));
}

/// Initialize data sources implementations
void _initDataSources() {
  inject.registerLazySingleton<AuthSourceImpl>(
      () => AuthSourceImpl(api: inject()));
  inject
      .registerLazySingleton<GigSourceImpl>(() => GigSourceImpl(api: inject()));
  inject.registerLazySingleton<CardScourceImpl>(
      () => CardScourceImpl(api: inject()));
  inject.registerLazySingleton<ChatSourcesImpl>(
      () => ChatSourcesImpl(api: inject()));
  inject.registerLazySingleton<ArtisanSourceImpl>(
      () => ArtisanSourceImpl(api: inject()));
}

/// Initialize data repositories implementations
void _initDataContracts() {
  inject.registerLazySingleton<AuthContractImpl>(
      () => AuthContractImpl(inject()));
  inject
      .registerLazySingleton<GigContractImpl>(() => GigContractImpl(inject()));
  inject.registerLazySingleton<CardContractImpl>(
      () => CardContractImpl(inject()));
  inject.registerLazySingleton<ChatContractImpl>(
      () => ChatContractImpl(inject()));
  inject.registerLazySingleton<ArtisanContractImpl>(
      () => ArtisanContractImpl(inject()));
}

/// Initialize services's here
void _initServices() {
  inject.registerLazySingleton<NetworkService>(
      () => NetworkService(baseUrl: AppConfig.coreBaseUrl));
  inject
      .registerLazySingleton<AuthApi>(() => AuthApi(networkService: inject()));
  inject
      .registerLazySingleton<CardApi>(() => CardApi(networkService: inject()));
  inject.registerLazySingleton<GigApi>(() => GigApi(networkService: inject()));
  inject
      .registerLazySingleton<ChatApi>(() => ChatApi(networkService: inject()));
  inject.registerLazySingleton<ArtisanApi>(
      () => ArtisanApi(networkService: inject()));
}

/// Initialize usecases here
void _initializeUsecase() {
  inject.registerLazySingleton<AuthUsesCases>(() => AuthUsesCases(inject()));
  inject.registerLazySingleton<CardUseCase>(() => CardUseCase(inject()));
  inject.registerLazySingleton<GigUseCases>(() => GigUseCases(inject()));
  inject.registerLazySingleton<ChatUseCase>(() => ChatUseCase(inject()));
  inject.registerLazySingleton<ArtisanUseCase>(() => ArtisanUseCase(inject()));
}
