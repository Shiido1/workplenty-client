import 'package:client/views/dashboard/gig/data/model/list_of_artisan_response/list_of_artisan_response.dart';

abstract class ArtisanSource {
  Future<ListOfArtisanResponse> listOfArtisans();
}
