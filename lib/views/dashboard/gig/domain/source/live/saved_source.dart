
import '../../../data/model/gigs_response/gigs_response.dart';

abstract class SavedGigListSource {
  Future<GigsResponse> savedGigList();
}
