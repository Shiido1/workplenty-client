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
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'gender': gender,
    };
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
}
