import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? email;
  final String? password;

  AuthEntity({this.email, this.password});

  @override
  List<Object> get props => [email!, password!];

  Map<String, dynamic> toRegister() {
    return {'email': email, 'password': password};
  }

  Map<String, dynamic> toLogin() {
    return {'email': email, 'password': password};
  }

  @override
  String toString() => 'AuthEntity(email: $email, password: $password)';
}
