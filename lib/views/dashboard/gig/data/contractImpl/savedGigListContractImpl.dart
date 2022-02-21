import 'package:client/views/dashboard/gig/data/model/saved_gig_list/saved_gig_list.model.dart';
import 'package:client/core/error/failures.dart';
import 'package:client/views/dashboard/gig/data/sourceImpl/savedSourceImpl.dart';
import 'package:client/views/dashboard/gig/domain/contract/saved_contract.dart';
import 'package:dartz/dartz.dart';

class SavedGigListContractImpl implements SavedGigListContract {
  final SavedGigListSourceImpl _impl;

  SavedGigListContractImpl(this._impl);

  @override
  Future<Either<Failure, SavedGigList>> saveGigList() async{
    try {
      final _response = await _impl.savedGigList();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}