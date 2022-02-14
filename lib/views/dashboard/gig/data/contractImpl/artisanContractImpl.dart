import 'package:client/core/error/failures.dart';
import 'package:client/views/dashboard/gig/data/model/list_of_artisan_response/list_of_artisan_response.dart';
import 'package:client/views/dashboard/gig/data/sourceImpl/artisanSourceImpl.dart';
import 'package:client/views/dashboard/gig/domain/contract/artisan_contract.dart';
import 'package:dartz/dartz.dart';

class ArtisanContractImpl implements ArtisanContract {
  final ArtisanSourceImpl _impl;

  ArtisanContractImpl(this._impl);

  @override
  Future<Either<Failure, ListOfArtisanResponse>> listOfArtisans() async {
    try {
      final _response = await _impl.listOfArtisans();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
