import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String? email;
  final String? password;

  LoginEntity({this.email, this.password});

  @override
  List<Object> get props => [email!, password!];

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() => 'LoginEntity(email: $email, password: $password)';
}
