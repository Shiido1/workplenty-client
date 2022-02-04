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
import 'package:client/views/dashboard/gig/data/contractImpl/gigContractImpl.dart';
import 'package:client/views/dashboard/gig/data/contractImpl/saved_gig_contract_impl.dart';
import 'package:client/views/dashboard/gig/data/contractImpl/saved_gig_save_contract_impl.dart';
import 'package:client/views/dashboard/gig/data/sourceImpl/gigSourceImpl.dart';
import 'package:client/views/dashboard/gig/data/sourceImpl/saved_gig_save_source_impl.dart';
import 'package:client/views/dashboard/gig/data/sourceImpl/saved_gig_source_impl.dart';
import 'package:client/views/dashboard/gig/domain/usecase/gig_usecase.dart';
import 'package:client/views/dashboard/gig/domain/usecase/saved_gig_save_usecase.dart';
import 'package:client/views/dashboard/gig/domain/usecase/saved_gig_usecase.dart';
import 'package:client/views/dashboard/gig/gigs/data/contractImpl/gig_category_contract_impl.dart';
import 'package:client/views/dashboard/gig/gigs/data/contractImpl/gig_detail_contract_impl.dart';
import 'package:client/views/dashboard/gig/gigs/data/sourceImpl/gig_category_source_impl.dart';
import 'package:client/views/dashboard/gig/gigs/data/sourceImpl/gig_detail_source_impl.dart';
import 'package:client/views/dashboard/gig/gigs/domain/usecase/gig_category_usecase.dart';
import 'package:client/views/dashboard/gig/gigs/domain/usecase/gig_detail_usecase.dart';
import 'package:client/views/dashboard/gig/presentation/saveGigBloc/saveGig_bloc.dart';
import 'package:client/views/dashboard/gig/presentation/saved_gig_save_bloc.dart/saved_gig_save_bloc.dart';
import 'package:client/views/onboarding/data/contractImpl/authContractImpl.dart';
import 'package:client/views/onboarding/data/sourceImpl/authSourceImpl.dart';
import 'package:client/views/onboarding/domain/usecases/auth_usecases.dart';
import 'package:client/views/onboarding/presentation/authentication/bloc/authbloc_bloc.dart';
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
  inject.registerLazySingleton<SaveGigBloc>(() => SaveGigBloc(inject()));
  inject.registerLazySingleton<SavedGigSaveBloc>(
      () => SavedGigSaveBloc(inject()));
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
  inject.registerLazySingleton<SavedGigSaveSourceimpl>(
      () => SavedGigSaveSourceimpl(api: inject()));
  inject.registerLazySingleton<SavedGigSourceImpl>(
      () => SavedGigSourceImpl(api: inject()));
  inject.registerLazySingleton<GigCategorySourcesImpl>(
      () => GigCategorySourcesImpl(api: inject()));
  inject.registerLazySingleton<GigDetailSourcesImpl>(
      () => GigDetailSourcesImpl(api: inject()));
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
  inject.registerLazySingleton<SavedGigContractImpl>(
      () => SavedGigContractImpl(inject()));
  inject.registerLazySingleton<SavedGigSaveContractimpl>(
      () => SavedGigSaveContractimpl(inject()));
  inject.registerLazySingleton<GigCategoryContractImpl>(
      () => GigCategoryContractImpl(inject()));
  inject.registerLazySingleton<GigDetailContractImpl>(
      () => GigDetailContractImpl(inject()));
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
}

/// Initialize usecases here
void _initializeUsecase() {
  inject.registerLazySingleton<AuthUsesCases>(() => AuthUsesCases(inject()));
  inject.registerLazySingleton<CardUseCase>(() => CardUseCase(inject()));
  inject.registerLazySingleton<GigUseCases>(() => GigUseCases(inject()));
  inject.registerLazySingleton<ChatUseCase>(() => ChatUseCase(inject()));
  inject.registerLazySingleton<SavedGigUseCases>(
      () => SavedGigUseCases(inject()));
  inject.registerLazySingleton<SavedGigSaveUseCases>(
      () => SavedGigSaveUseCases(inject()));
  inject.registerLazySingleton<GigCategoryUseCase>(
      () => GigCategoryUseCase(inject()));
  inject.registerLazySingleton<GigDetailUseCase>(
      () => GigDetailUseCase(inject()));
}
