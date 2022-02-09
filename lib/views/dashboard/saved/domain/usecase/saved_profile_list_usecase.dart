  import 'package:client/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../data/contractImpl/saved_profile_contract_impl.dart';
import '../../data/model/saved_profile_list_response/saved_profile_model_response/saved_profile_model_response.dart';

class SavedProfileListUseCase extends UseCase {
  final SavedProfileContractImpl _contractImpl;

  SavedProfileListUseCase(this._contractImpl);

   @override
  Future<Either<Failure, SavedProfileModelResponse>>? savedProfileList() async {
    return await _contractImpl.savedProfileListContract();
  }

}