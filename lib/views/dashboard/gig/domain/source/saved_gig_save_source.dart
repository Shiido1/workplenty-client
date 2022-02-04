import 'package:client/core/general_model/general_model/general_model.dart';
import 'package:client/views/dashboard/gig/domain/entity/saved_gig-save_entity.dart';

abstract class SavedGigSaveSource {
  Future<GeneralModel> savedGigSave(SavedGigSaveEntity entity);
}
