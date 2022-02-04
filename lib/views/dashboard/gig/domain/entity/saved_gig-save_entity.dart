import 'package:client/core/general_model/general_model/general_model.dart';

class SavedGigSaveEntity extends GeneralModel {
  final String? gigId;

  SavedGigSaveEntity({this.gigId});

  @override
  // ignore: override_on_non_overriding_member
  List<Object?> get props => [];

  Map<String, dynamic> save() {
    return {'gig_id': gigId};
  }
}
