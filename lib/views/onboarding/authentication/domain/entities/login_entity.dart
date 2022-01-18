// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  String? email;
  String? password;

  LoginEntity({this.email, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["password"] = password;
    return data;
  }

  @override
  List<Object?> get props => [];
}