// ignore_for_file: must_be_immutable

import '../../../../../core/entity/default_response.dart';

class AddressEntity extends DefaultResponse {
  final int? countryID;
  final int? stateID;
  final int? cityID;
  final String? address;
  final String? apartmentNo;
  final String? zipCode;
  final String? phone;
  final String? country;

  AddressEntity(
      {required this.countryID,
      required this.stateID,
      required this.cityID,
      required this.address,
      required this.apartmentNo,
      required this.zipCode,
      required this.country,
      required this.phone});

  Map<String, dynamic> toMap() {
    return {
      'country_id': countryID,
      'state_id': stateID,
      'city_id': cityID,
      'address': address,
      'apartment_no': apartmentNo,
      'zip_code': zipCode,
      'phone': phone,
      'country': country,
    };
  }
}
