import 'package:client/core/general_model/general_model/general_model.dart';
import 'package:client/core/error/failures.dart';
import 'package:client/views/dashboard/gig/data/sourceImpl/saved_gig_source_impl.dart';
import 'package:client/views/dashboard/gig/domain/contract/saved_gig_contract.dart';
import 'package:dartz/dartz.dart';

class SavedGigContractImpl implements SavedGigContract {
  final SavedGigSourceImpl _impl;

  SavedGigContractImpl(this._impl);

  @override
  Future<Either<Failure, GeneralModel>> savedGig() async {
    try {
      final _response = await _impl.savedGig();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
