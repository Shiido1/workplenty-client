import 'package:client/core/api/artisan/artisan_api.dart';
import 'package:client/views/dashboard/gig/domain/source/live/artisan_source.dart';

import '../model/gigs_response/gigs_response.dart';

class ArtisanSourceImpl implements ArtisanSource {
  final ArtisanApi _api;

  ArtisanSourceImpl({required ArtisanApi api}) : _api = api;

  @override
  Future<GigsResponse> listOfArtisans() async {
    return await _api.listOfArtisan();
  }
}
