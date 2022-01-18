// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class StartLoginEvent extends LoginEvent {
  LoginEntity? loginEntity;

  StartLoginEvent({this.loginEntity});
}
