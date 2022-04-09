import 'package:client/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/gigs_response/gigs_response.dart';

abstract class ArtisanContract {
  Future<Either<Failure, GigsResponse>> listOfArtisans();
}
