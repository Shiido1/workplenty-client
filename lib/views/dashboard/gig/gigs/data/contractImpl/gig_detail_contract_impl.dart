import 'package:client/core/error/failures.dart';
import 'package:client/core/general_model/general_model/general_model.dart';
import 'package:client/views/dashboard/gig/gigs/data/sourceImpl/gig_detail_source_impl.dart';
import 'package:client/views/dashboard/gig/gigs/domain/contract/gig_detail_contract.dart';
import 'package:dartz/dartz.dart';

class GigDetailContractImpl implements GigDetailContract {
  final GigDetailSourcesImpl _impl;

  GigDetailContractImpl(this._impl);

  @override
  Future<Either<Failure, GeneralModel>> gigDetail() async {
    try {
      final _response = await _impl.gigDetailSource();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
