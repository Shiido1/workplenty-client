import 'package:client/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/gigs_response/gigs_response.dart';
import '../entity/gig/gig_entity.dart';

abstract class ArtisanContract {
  Future<Either<Failure, GigsResponse>> listOfArtisans(
      {required GigEntity? entity});
}
