import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final String? email;
  final String? password;
  final String? fname;
  final String? lname;
  final String? phone;
  final String? role;

  RegisterEntity({
    this.email,
    this.password,
    this.fname,
    this.lname,
    this.phone,
    this.role,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'fname': fname,
      'lname': lname,
      'phone': phone,
      'role': role,
    };
  }

  @override
  String toString() {
    return 'RegisterEntity(email: $email, password: $password, fname: $fname, lname: $lname, phone: $phone, role: $role)';
  }

  @override
  List<Object> get props {
    return [email!, password!, fname!, lname!, phone!, role!];
  }
}
