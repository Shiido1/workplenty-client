import 'package:equatable/equatable.dart';

class VerificationPinResponseEntity extends Equatable {
  final String? pin;

  VerificationPinResponseEntity({this.pin});

  Map<String, dynamic> toMap() {
    return {'pin': pin};
  }

  @override
  List<Object> get props {
    return [pin!];
  }
}
