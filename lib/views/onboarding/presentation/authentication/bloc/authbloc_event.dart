part of 'authbloc_bloc.dart';

abstract class AuthblocEvent extends Equatable {
  const AuthblocEvent();

  @override
  List<Object> get props => [];
}

class RegisterEvent extends AuthblocEvent {
  final AuthEntity entity;

  const RegisterEvent(this.entity);
}

class LoginEvent extends AuthblocEvent {
  final AuthEntity entity;

  const LoginEvent(this.entity);
}

class VerifyPinEvent extends AuthblocEvent {
  final AuthEntity entity;

  const VerifyPinEvent(this.entity);
}