import 'package:client/core/error/failures.dart';
import 'package:client/core/general_model/general_model/general_model.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/dashboard/gig/gigs/data/contractImpl/gig_category_contract_impl.dart';
import 'package:dartz/dartz.dart';

class GigCategoryUseCase extends UseCase {
  final GigCategoryContractImpl _categoryContractImpl;

  GigCategoryUseCase(this._categoryContractImpl);

  Future<Either<Failure, GeneralModel>>? gigCategoryUseCase() async {
    return await _categoryContractImpl.gigCategory();
  }
}

// class Params extends Equatable {
//   final ChatEntity? entity;

//   const Params({required this.entity});

//   @override
//   List<Object?> get props => [entity!];
// }