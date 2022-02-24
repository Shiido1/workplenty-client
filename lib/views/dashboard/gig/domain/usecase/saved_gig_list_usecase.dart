import 'package:client/core/error/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/dashboard/gig/data/contractImpl/savedGigListContractImpl.dart';
import 'package:client/views/dashboard/gig/data/model/saved_gig_list/saved_gig_list.model.dart';
import 'package:dartz/dartz.dart';

class SavedGigListUseCase extends UseCase<SavedGigList, NoParams> {
  final SavedGigListContractImpl _repository;

  SavedGigListUseCase(this._repository);

  @override
  Future<Either<Failure, SavedGigList>>? listOfSavedGigs() async {
    return await _repository.saveGigList();
  }
}