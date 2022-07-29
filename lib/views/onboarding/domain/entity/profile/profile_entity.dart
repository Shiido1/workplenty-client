// ignore_for_file: must_be_immutable

import 'package:client/core/entity/default_response.dart';
import 'package:dio/dio.dart';

class ProfileEntity extends DefaultResponse {
  final String? title;
  final String? description;
  final String? gender;
  final MultipartFile? avatar;
  final int? countryID;
  final int? stateID;
  final int? cityID;
  final String? zipcode;
  final String? address;
  final String? appartment;
  final String? role;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? username;
  final String? phone;

  ProfileEntity({
    this.title,
    this.description,
    this.gender,
    this.avatar,
    this.countryID,
    this.stateID,
    this.cityID,
    this.zipcode,
    this.address,
    this.appartment,
    this.firstName,
    this.lastName,
    this.email,
    this.username,
    this.phone,
    this.role,
  });

  Map<String, dynamic> toMap() {
    return {'title': title, 'description': description};
  }

  Map<String, dynamic> toAvatar() {
    return {'avatar': avatar};
  }

  Map<String, dynamic> toLocation() {
    return {
      'country_id': countryID,
      'state_id': stateID,
      'city_id': cityID,
      'zipcode': zipcode,
      'address': address,
      'appartment': appartment
    };
  }

  Map<String, dynamic> updateAccount() => {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'username': username,
        'role': role,
        'phone': phone,
      };
}
