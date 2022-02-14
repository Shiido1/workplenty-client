import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';
import 'package:client/views/dashboard/gig/data/model/list_of_artisan_response/list_of_artisan_response.dart';

class ArtisanApi {
  final NetworkService _networkService;

  ArtisanApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<ListOfArtisanResponse> listOfArtisan() async {
    try {
      final _response = await _networkService.call(
          UrlConfig.listOfArtisans, RequestMethod.get);
      return ListOfArtisanResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }
}
