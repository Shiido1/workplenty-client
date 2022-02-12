part of 'servicebloc_bloc.dart';

abstract class ServiceblocState extends Equatable {
  const ServiceblocState();

  @override
  List<Object> get props => [];
}

class ServiceblocInitial extends ServiceblocState {}

class ServiceblocLoading extends ServiceblocState {}

class ServiceblocFailed extends ServiceblocState {
  final String message;
  ServiceblocFailed({required this.message});
}

class ServiceblocSuccess extends ServiceblocState {
  final dynamic response;
  ServiceblocSuccess({required this.response});
}
