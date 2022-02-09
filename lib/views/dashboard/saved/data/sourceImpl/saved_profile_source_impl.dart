import 'package:client/core/api/saved_profile/saved_profile_api.dart';
import 'package:client/views/dashboard/saved/data/model/saved_profile_list_response/saved_profile_model_response/saved_profile_model_response.dart';
import 'package:client/views/dashboard/saved/domain/entity/saved_profile_entity.dart';
import 'package:client/views/dashboard/saved/data/model/saved_profile_response.dart';
import 'package:client/views/dashboard/saved/domain/source/live/saved_profile_source.dart';

class SavedProfileSourceImpl implements SavedProfileSource {
  final SavedProfileApi _api;

  SavedProfileSourceImpl({required SavedProfileApi api}) : _api = api;

  @override
  Future<SavedProfileResponse> savedProfileSource(
      SavedProfileEntity entity) async {
    return await _api.savedProfile(entity);
  }

  @override
  Future<SavedProfileModelResponse> savedProfileListSource() async {
   return await _api.savedProfileList();
  }
}
