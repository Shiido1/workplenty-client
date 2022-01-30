import 'package:equatable/equatable.dart';

class ForgotPasswordEntity extends Equatable {
  final String? email;

  ForgotPasswordEntity({this.email});

  Map<String, dynamic> toMap() {
    return {'email': email};
  }

  @override
  String toString() {
    return 'ForgotPasswordEntity(email: $email)';
  }

  @override
  List<Object> get props {
    return [email!];
  }
}
