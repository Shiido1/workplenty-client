import '../../../data/model/gigs_response/gigs_response.dart';

abstract class ArtisanSource {
  Future<GigsResponse> listOfArtisans();
}
