import 'package:client/core/error/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/dashboard/gig/data/contractImpl/savedGigListContractImpl.dart';
import 'package:client/views/dashboard/gig/data/model/saved_gig_list/saved_gig_list.model.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/available_gig_response/available_gig_response.dart';
import '../../data/model/list_of_artisan_response/list_of_artisan_response.dart';

class SavedGigListUseCase extends UseCase<ListOfArtisanResponse, NoParams> {
  final SavedGigListContractImpl _repository;

  SavedGigListUseCase(this._repository);

  @override
  Future<Either<Failure, ListOfArtisanResponse>>? listOfSavedGigs() async {
    return await _repository.saveGigList();
  }
}