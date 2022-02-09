import 'package:client/core/api/artisan/artisan_api.dart';
import 'package:client/views/dashboard/gig/data/model/list_of_artisan_response/list_of_artisan_response.dart';
import 'package:client/views/dashboard/gig/domain/source/live/artisan_source.dart';

class ArtisanSourceImpl implements ArtisanSource {
  final ArtisanApi _api;

  ArtisanSourceImpl({required ArtisanApi api}) : _api = api;

  @override
  Future<ListOfArtisanResponse> listOfArtisans() async {
    return await _api.listOfArtisan();
  }
}
