import 'package:client/views/dashboard/gig/data/model/saved_gig_list/saved_gig_list.model.dart';

import '../../../data/model/available_gig_response/available_gig_response.dart';
import '../../../data/model/list_of_artisan_response/list_of_artisan_response.dart';

abstract class SavedGigListSource {
  Future<ListOfArtisanResponse> savedGigList();
}