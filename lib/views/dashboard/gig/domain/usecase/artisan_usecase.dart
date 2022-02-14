import 'package:client/core/error/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/dashboard/gig/data/contractImpl/artisanContractImpl.dart';
import 'package:client/views/dashboard/gig/data/model/list_of_artisan_response/list_of_artisan_response.dart';
import 'package:dartz/dartz.dart';

class ArtisanUseCase extends UseCase<ListOfArtisanResponse, NoParams> {
  final ArtisanContractImpl _repository;

  ArtisanUseCase(this._repository);

  @override
  Future<Either<Failure, ListOfArtisanResponse>>? listOfArtisan() async {
    return await _repository.listOfArtisans();
  }
}
