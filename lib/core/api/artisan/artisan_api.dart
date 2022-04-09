import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';

import '../../../views/dashboard/gig/data/model/gigs_response/gigs_response.dart';

class ArtisanApi {
  final NetworkService _networkService;

  ArtisanApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<GigsResponse> listOfArtisan() async {
    try {
      final _response = await _networkService.call(
          UrlConfig.listOfArtisans, RequestMethod.get);
      return GigsResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }
}
