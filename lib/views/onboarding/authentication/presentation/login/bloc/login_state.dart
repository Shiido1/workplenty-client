// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  dynamic response;
  LoginSuccessState({required this.response});
}

class LoginFailedState extends LoginState {
  String message;
  LoginFailedState({required this.message});
}
