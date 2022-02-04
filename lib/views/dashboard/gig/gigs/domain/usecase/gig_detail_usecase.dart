import 'package:client/core/error/failures.dart';
import 'package:client/core/general_model/general_model/general_model.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/dashboard/gig/gigs/data/contractImpl/gig_detail_contract_impl.dart';
import 'package:dartz/dartz.dart';

class GigDetailUseCase extends UseCase {
  final GigDetailContractImpl _detailContractImpl;

  GigDetailUseCase(this._detailContractImpl);

  Future<Either<Failure, GeneralModel>>? gigDetailUseCase() async {
    return await _detailContractImpl.gigDetail();
  }
}
