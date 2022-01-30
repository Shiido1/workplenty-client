import 'package:equatable/equatable.dart';

class PinEntity extends Equatable {
  final String? pin;

  PinEntity({this.pin});

  @override
  List<Object> get props => [pin!];

  Map<String, dynamic> toJson() {
    return {'pin': pin};
  }

  @override
  String toString() => 'PinEntity(email: $pin)';
}
