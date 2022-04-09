// ignore_for_file: must_be_immutable

import 'package:client/core/entity/default_response.dart';
import 'package:client/core/enums/gig_type.dart';

class SavedProfileEntity extends DefaultResponse {
  final int? profileId;
  final GigType? type;

  SavedProfileEntity({
    this.profileId,
    this.type,
  });

  toMap() {
    return {
      'profile_id': profileId,
      'type': fromGigType(type),
    };
  }
}
