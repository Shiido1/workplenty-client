import 'package:client/core/api/gig/gig_api.dart';
import 'package:client/views/dashboard/gig/domain/entity/saved_gig-save_entity.dart';
import 'package:client/core/general_model/general_model/general_model.dart';
import 'package:client/views/dashboard/gig/domain/source/saved_gig_save_source.dart';

class SavedGigSaveSourceimpl implements SavedGigSaveSource {
  final GigApi _api;

  SavedGigSaveSourceimpl({required GigApi api}) : _api = api;

  @override
  Future<GeneralModel> savedGigSave(SavedGigSaveEntity entity) async {
    return await _api.savedGigSave(entity);
  }
}
