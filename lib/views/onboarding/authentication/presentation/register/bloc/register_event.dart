// ignore_for_file: must_be_immutable

part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class StartRegisterEvent extends RegisterEvent {
  RegisterEntity? registerEntity;

  StartRegisterEvent({this.registerEntity});
}
