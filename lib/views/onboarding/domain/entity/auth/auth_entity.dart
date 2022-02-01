// ignore_for_file: must_be_immutable

import 'package:client/core/entity/default_response.dart';
import 'package:equatable/equatable.dart';

class AuthEntity extends DefaultResponse {
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? role;
  final String? username;

  AuthEntity({
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.phone,
    this.role,
    this.username,
  });

  @override
  List<Object> get props => [email!, password!];

  Map<String, dynamic> toRegister() {
    return {
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'username': username,
      'phone': phone,
      'role': 'client'
    };
  }

  Map<String, dynamic> toLogin() {
    return {'email': email, 'password': password};
  }

  @override
  String toString() => 'AuthEntity(email: $email, password: $password)';
}
