// ignore_for_file: must_be_immutable

import 'package:client/core/entity/user_entity.dart';
import 'package:client/views/onboarding/authentication/domain/entities/login_entity.dart';

class LoginResponseModel extends LoginEntity{
  String? msg;
  Data? data;
  bool? success;
  int? code;

  LoginResponseModel({this.msg, this.data, this.success, this.code});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    data['code'] = this.code;
    return data;
  }
}

class Data {
  String? token;
  String? tokenType;
  User? user;

  Data({this.token, this.tokenType, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    tokenType = json['token_type'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['token_type'] = this.tokenType;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}


