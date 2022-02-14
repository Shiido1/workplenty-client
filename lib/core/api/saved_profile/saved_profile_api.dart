import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';
import 'package:client/views/dashboard/saved/data/model/saved_profile_list_response/saved_profile_model_response/saved_profile_model_response.dart';
import 'package:client/views/dashboard/saved/data/model/saved_profile_response.dart';
import 'package:client/views/dashboard/saved/domain/entity/saved_profile_entity.dart';

class SavedProfileApi {
  final NetworkService _networkService;

  SavedProfileApi({required NetworkService networkService})
      : _networkService = networkService;

  /// Saves a client gigs
  Future<SavedProfileResponse> savedProfile(SavedProfileEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.savedProfile, RequestMethod.post,
          data: entity.toMap());
      return SavedProfileResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<SavedProfileModelResponse> savedProfileList() async {
    try {
      final _response = await _networkService.call(
          UrlConfig.savedProfileList, RequestMethod.get);
      return SavedProfileModelResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }
}
