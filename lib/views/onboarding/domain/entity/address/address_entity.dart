// ignore_for_file: must_be_immutable

import '../../../../../core/entity/default_response.dart';

class AddressEntity extends DefaultResponse {
  final int? countryID;
  final int? stateID;
  final String? address;
  final String? apartmentNo;
  final String? zipCode;
  final String? city;

  AddressEntity(
      {required this.countryID,
      required this.stateID,
      required this.address,
      required this.apartmentNo,
      required this.zipCode,
      required this.city,
      });

  Map<String, dynamic> toMap() {
    return {
      'country_id': countryID,
      'state_id': stateID,
      'address': address,
      'apartment_no': apartmentNo,
      'zip_code': zipCode,
      'city': city,
    };
  }
}
