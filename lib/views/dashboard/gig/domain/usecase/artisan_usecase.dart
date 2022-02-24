import 'package:client/core/error/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/dashboard/gig/data/contractImpl/artisanContractImpl.dart';
import 'package:client/views/dashboard/gig/data/model/gigs_response/gigs_response.dart';
import 'package:dartz/dartz.dart';

class ArtisanUseCase extends UseCase<GigsResponse, NoParams> {
  final ArtisanContractImpl _repository;

  ArtisanUseCase(this._repository);

  @override
  Future<Either<Failure, GigsResponse>>? listOfArtisan() async {
    return await _repository.listOfArtisans();
  }
}
