import 'package:equatable/equatable.dart';

class VerificationPinRequestEntity extends Equatable {
  final String? email;
  final String? pin;
  final String? password;

  VerificationPinRequestEntity({this.email, this.pin, this.password});

  Map<String, dynamic> toMap() {
    return {'email': email, 'pin': pin, 'password': password};
  }

  @override
  List<Object> get props {
    return [email!, pin!, password!];
  }
}
