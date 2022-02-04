import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';
import 'package:client/views/dashboard/gig/data/model/save_gig_response/save_gig_response.dart';
import 'package:client/views/dashboard/gig/domain/entity/gig/gig_entity.dart';
import 'package:client/views/dashboard/gig/domain/entity/saved_gig-save_entity.dart';

class GigApi {
  final NetworkService _networkService;

  GigApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<SaveGigResponse> saveGig(GigEntity entity) async {
    try {
      final _response = await _networkService
          .call(UrlConfig.saveGig, RequestMethod.post, data: {});
      return SaveGigResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> removeAttachment(GigEntity entity) async {
    try {
      await _networkService
          .call(UrlConfig.removeAttachment, RequestMethod.post, data: {});
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> savedGig() async {
    try {
      await _networkService.call(UrlConfig.savedGig, RequestMethod.get);
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> savedGigSave(SavedGigSaveEntity entity) async {
    try {
      await _networkService.call(UrlConfig.savedGigSave, RequestMethod.post);
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> gigList() async {
    try {
      await _networkService.call(UrlConfig.gigList, RequestMethod.get);
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> gigDetail() async {
    try {
      await _networkService.call(UrlConfig.gigDetails, RequestMethod.get);
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> gigCategory() async {
    try {
      await _networkService.call(UrlConfig.gigCategory, RequestMethod.get);
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> gigSkill() async {
    try {
      await _networkService.call(UrlConfig.gigSkill, RequestMethod.get);
      return;
    } catch (e) {
      rethrow;
    }
  }
}
