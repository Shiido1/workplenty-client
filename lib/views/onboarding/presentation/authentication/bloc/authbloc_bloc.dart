import 'package:bloc/bloc.dart';
import 'package:client/views/onboarding/domain/entity/auth/auth_entity.dart';
import 'package:client/views/onboarding/domain/usecases/auth_usecases.dart';
import 'package:equatable/equatable.dart';

part 'authbloc_event.dart';
part 'authbloc_state.dart';

class AuthblocBloc extends Bloc<AuthblocEvent, AuthblocState> {
  final AuthUsesCases _useCase;

  AuthblocBloc(this._useCase) : super(AuthblocInitial()) {
    on<AuthblocEvent>((event, emit) async {
      // / Register Event
      if (event is RegisterEvent) {
        try {
          emit(AuthblocLoading());
          final _response =
              await _useCase.registerUseCase(Params(entity: event.entity));
          _response.fold(
              (l) => emit(AuthblocFailed(message: l.errorMessage(l)!)),
              (r) => emit(AuthblocSuccess(response: r)));
        } catch (e) {
          emit(AuthblocFailed(message: e.toString()));
        }
      }

      /// Login Event
      if (event is LoginEvent) {
        try {
          emit(AuthblocLoading());
          final _response =
              await _useCase.loginUseCase(Params(entity: event.entity));
          _response.fold(
              (l) => emit(AuthblocFailed(message: l.errorMessage(l)!)),
              (r) => emit(AuthblocSuccess(response: r)));
        } catch (e) {
          emit(AuthblocFailed(message: e.toString()));
        }
      }

      /// Verify PIN Event
      if (event is VerifyPinEvent) {
        try {
          emit(AuthblocLoading());
          final _response =
              await _useCase.loginUseCase(Params(entity: event.entity));
          _response.fold(
              (l) => emit(AuthblocFailed(message: l.errorMessage(l)!)),
              (r) => emit(AuthblocSuccess(response: r)));
        } catch (e) {
          emit(AuthblocFailed(message: e.toString()));
        }
      }
    });
  }
}
