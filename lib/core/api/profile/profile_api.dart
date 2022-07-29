import 'package:client/core/database/session_manager.dart';
import 'package:client/core/entity/default_response.dart';
import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';
import 'package:client/views/onboarding/data/model/address_model.dart';
import 'package:client/views/onboarding/domain/entity/profile/profile_entity.dart';
import 'package:dio/dio.dart';

import '../../../views/onboarding/data/model/location_response/location_response.dart';
import '../../../views/onboarding/domain/entity/address/address_entity.dart';
import '../../entity/user/user.dart';

class ProfileApi {
  final NetworkService _networkService;

  ProfileApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<DefaultResponse> profileBioUpdate(ProfileEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.profileBioUpdate, RequestMethod.post,
          data: entity.toMap());
      return DefaultResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<DefaultResponse> profileLocationUpdate(ProfileEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.profileLocationUpdate, RequestMethod.post,
          data: entity.toLocation());
      return DefaultResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<DefaultResponse> profileAvatarUpdate(ProfileEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.profileAvatarUpdate, RequestMethod.upload,
          formData: FormData.fromMap(entity.toAvatar()));
      return DefaultResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<LocationResponse> getListOfStates(int id) async {
    try {
      final _response = await _networkService
          .call(UrlConfig.states, RequestMethod.get, queryParams: {'country_id': id});
      return LocationResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<LocationResponse> getListOfCity(int id) async {
    try {
      final _response = await _networkService
          .call(UrlConfig.states, RequestMethod.get, queryParams: {'state_id': id});
      return LocationResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<LocationResponse> getListOfCountries() async {
    try {
      final _response =
          await _networkService.call(UrlConfig.countries, RequestMethod.get);
      return LocationResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<User> profileInfo() async {
    try {
      /// FIXME: return users information from users information API
      /*   final _response = await _networkService.call(
          UrlConfig.clientProfile, RequestMethod.get); */
      return User.fromJson(SessionManager.instance.usersData);
    } catch (e) {
      rethrow;
    }
  }

  Future<DefaultResponse> updateAccount(ProfileEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.updateAccount, RequestMethod.post,
          data: entity.updateAccount());
      return DefaultResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<DefaultResponse> updateAddress(AddressEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.updateAddress, RequestMethod.post,
          data: entity.toMap());
      return DefaultResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AddressModel> profileAddress() async {
    try {
      final _response = await _networkService.call(
          UrlConfig.artisanAddress, RequestMethod.get);
      return AddressModel.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }
}
