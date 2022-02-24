import 'package:client/core/error/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/dashboard/gig/data/contractImpl/savedGigListContractImpl.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/gigs_response/gigs_response.dart';

class SavedGigListUseCase extends UseCase<GigsResponse, NoParams> {
  final SavedGigListContractImpl _repository;

  SavedGigListUseCase(this._repository);

  @override
  Future<Either<Failure, GigsResponse>>? listOfSavedGigs() async {
    return await _repository.saveGigList();
  }
}
