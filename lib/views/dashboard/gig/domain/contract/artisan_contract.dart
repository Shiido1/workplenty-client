import 'package:client/core/error/failures.dart';
import 'package:client/views/dashboard/gig/data/model/list_of_artisan_response/list_of_artisan_response.dart';
import 'package:dartz/dartz.dart';

abstract class ArtisanContract {
  Future<Either<Failure, ListOfArtisanResponse>> listOfArtisans();
}
