import '../../../data/model/gigs_response/gigs_response.dart';
import '../../entity/gig/gig_entity.dart';

abstract class ArtisanSource {
  Future<GigsResponse> listOfArtisans({required GigEntity? entity});
}
