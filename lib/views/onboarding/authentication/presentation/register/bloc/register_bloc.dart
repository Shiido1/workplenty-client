import 'package:bloc/bloc.dart';
import 'package:client/views/onboarding/authentication/domain/entities/register_entity.dart';
import 'package:client/views/onboarding/authentication/domain/usecase/register_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase? registerUseCase;

  RegisterBloc(this.registerUseCase)
      : assert(registerUseCase != null),
        super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is StartRegisterEvent) {
        emit(RegisterLoadingState());
        final _response = await registerUseCase!(Params(register: event.registerEntity));
        _eitherLoadedOrErrorState(emit: emit, response: _response);
      }
    });
  }

  void _eitherLoadedOrErrorState(
      {Emitter<RegisterState>? emit,
      Either<dynamic, RegisterEntity>? response}) async {
    response!.fold(
        (left) => emit!(RegisterFailedState(message: left.errorMessage ?? '')),
        (right) => emit!(RegisterSuccessState(response: right)));
  }
}
