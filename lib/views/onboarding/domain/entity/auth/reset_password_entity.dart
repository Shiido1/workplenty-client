import 'package:equatable/equatable.dart';

class ResetPasswordEntity extends Equatable {
  final String? email;
  final String? pin;
  final String? password;

  ResetPasswordEntity({this.email, this.pin, this.password});

  Map<String, dynamic> toMap() {
    return {'email': email, 'pin': pin, 'password': password};
  }

  @override
  List<Object> get props {
    return [email!, pin!, password!];
  }
}
