import 'package:bloc/bloc.dart';
import 'package:client/views/onboarding/authentication/domain/entities/login_entity.dart';
import 'package:client/views/onboarding/authentication/domain/usecase/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase? loginUseCase;

  LoginBloc(this.loginUseCase)
      : assert(loginUseCase != null),
        super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is StartLoginEvent) {
        emit(LoginLoadingState());
        final _response = await loginUseCase!(Params(login: event.loginEntity));
        _eitherLoadedOrErrorState(emit: emit, response: _response);
      }
    });
  }

  void _eitherLoadedOrErrorState(
      {Emitter<LoginState>? emit,
      Either<dynamic, LoginEntity>? response}) async {
    response!.fold(
        (left) => emit!(LoginFailedState(message: left.errorMessage ?? '')),
        (right) => emit!(LoginSuccessState(response: right)));
  }
}
