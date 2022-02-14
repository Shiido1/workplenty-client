import 'package:client/views/dashboard/saved/data/model/saved_profile_list_response/saved_profile_model_response/saved_profile_model_response.dart';
import 'package:client/views/dashboard/saved/data/model/saved_profile_response.dart';
import '../../entity/saved_profile_entity.dart';

abstract class SavedProfileSource {
  Future<SavedProfileResponse> savedProfileSource(SavedProfileEntity entity);
  Future<SavedProfileModelResponse> savedProfileListSource();
}
