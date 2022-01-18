// ignore_for_file: must_be_immutable

part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  dynamic response;
  RegisterSuccessState({required this.response});
}

class RegisterFailedState extends RegisterState {
  String message;
  RegisterFailedState({required this.message});
}
