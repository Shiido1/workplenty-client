import 'package:client/core/error/failures.dart';
import 'package:client/core/general_model/general_model/general_model.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/dashboard/gig/data/contractImpl/saved_gig_contract_impl.dart';
import 'package:dartz/dartz.dart';

class SavedGigUseCases extends UseCase {
  final SavedGigContractImpl _savedGigContractimpl;

  SavedGigUseCases(this._savedGigContractimpl);

  Future<Either<Failure, GeneralModel>>? savedGigUseCase() async {
    return await _savedGigContractimpl.savedGig();
  }
}
