import 'package:client/core/entity/default_response.dart';
import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';
import 'package:client/views/dashboard/gig/data/model/available_gig_response/available_gig_response.dart';
import 'package:client/views/dashboard/gig/data/model/saved_client_gig_response/saved_client_gig_response.dart';
import 'package:client/views/dashboard/gig/data/model/saved_gig_list/saved_gig_list.model.dart';
import 'package:client/views/dashboard/gig/domain/entity/gig/gig_entity.dart';
import 'package:dio/dio.dart';

import '../../../views/dashboard/gig/data/model/category_of_gig_response/category_of_gig_response.dart';
import '../../../views/dashboard/gig/data/model/details_of_gig_response/details_of_gig_response.dart';
import '../../../views/dashboard/gig/data/model/list_of_artisan_response/list_of_artisan_response.dart';
import '../../../views/dashboard/gig/data/model/list_of_skills_response/list_of_skills_response.dart';

class GigApi {
  final NetworkService _networkService;

  GigApi({required NetworkService networkService})
      : _networkService = networkService;

  /// Saves a client gigs
  Future<SavedClientGigResponse> saveClientsGig(GigEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.saveGig, RequestMethod.upload,
          formData: FormData.fromMap(entity.saveClientsGig()));
      return SavedClientGigResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  /// Removes attachments from a gig
  Future<DefaultResponse> removeAttachment(GigEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.removeAttachment, RequestMethod.post,
          data: entity.removeAttachment());
      return DefaultResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  /// Save a gig
  Future<DefaultResponse> savedGigsSave(GigEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.savedGig, RequestMethod.post,
          data: entity.savedGigsSave());
      return DefaultResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

    /// Show saved gigs
  Future<ListOfArtisanResponse> savedGigList() async {
    try {
      final _response = await _networkService.call(
          UrlConfig.savedGig, RequestMethod.get);
      return ListOfArtisanResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  /// Return a list of available lists
  Future<AvailableGigResponse> getListOfAvailableGigs(
      {required GigEntity entity}) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.gigList, RequestMethod.get,
          queryParams: entity.availableListQuery());
      return AvailableGigResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  ///  Returns the details of gigs
  Future<DetailsOfGigResponse> getDetailsOfGig(
      {required GigEntity entity}) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.gigDetails, RequestMethod.get,
          queryParams: entity.getDetailsOfGig());
      return DetailsOfGigResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  ///  Returns the categories of gigs
  Future<CategoryOfGigResponse> categoriesOfGig() async {
    try {
      final _response =
          await _networkService.call(UrlConfig.gigCategory, RequestMethod.get);

      return CategoryOfGigResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  ///  Returns the list of gigs
  Future<ListOfSkillsResponse> listOfSkills() async {
    try {
      final _response =
          await _networkService.call(UrlConfig.gigSkill, RequestMethod.get);
      return ListOfSkillsResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }
}
