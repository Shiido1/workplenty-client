part of 'servicebloc_bloc.dart';

abstract class ServiceblocEvent extends Equatable {
  const ServiceblocEvent();

  @override
  List<Object> get props => [];
}

class ServiceEvent extends ServiceblocEvent {
  final GigEntity entity;

  ServiceEvent(this.entity);
}
