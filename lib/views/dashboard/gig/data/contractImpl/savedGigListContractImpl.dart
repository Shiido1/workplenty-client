import 'package:client/core/error/failures.dart';
import 'package:client/views/dashboard/gig/data/sourceImpl/savedSourceImpl.dart';
import 'package:client/views/dashboard/gig/domain/contract/saved_contract.dart';
import 'package:dartz/dartz.dart';

import '../model/gigs_response/gigs_response.dart';

class SavedGigListContractImpl implements SavedGigListContract {
  final SavedGigListSourceImpl _impl;

  SavedGigListContractImpl(this._impl);

  @override
  Future<Either<Failure, GigsResponse>> saveGigList() async {
    try {
      final _response = await _impl.savedGigList();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
