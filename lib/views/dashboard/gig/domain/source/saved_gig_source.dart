import 'package:client/core/general_model/general_model/general_model.dart';

abstract class SavedGigSource {
  Future<GeneralModel> savedGig();
}
