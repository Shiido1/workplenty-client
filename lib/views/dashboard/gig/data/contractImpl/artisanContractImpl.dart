import 'package:client/core/error/failures.dart';
import 'package:client/views/dashboard/gig/data/sourceImpl/artisanSourceImpl.dart';
import 'package:client/views/dashboard/gig/domain/contract/artisan_contract.dart';
import 'package:dartz/dartz.dart';

import '../model/gigs_response/gigs_response.dart';

class ArtisanContractImpl implements ArtisanContract {
  final ArtisanSourceImpl _impl;

  ArtisanContractImpl(this._impl);

  @override
  Future<Either<Failure, GigsResponse>> listOfArtisans() async {
    try {
      final _response = await _impl.listOfArtisans();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
