import 'package:client/core/error/failures.dart';
import 'package:client/core/general_model/general_model/general_model.dart';
import 'package:client/views/dashboard/gig/gigs/data/sourceImpl/gig_category_source_impl.dart';
import 'package:client/views/dashboard/gig/gigs/domain/contract/gig_category_contract.dart';
import 'package:dartz/dartz.dart';

class GigCategoryContractImpl implements GigCategoryContract {
  final GigCategorySourcesImpl _impl;

  GigCategoryContractImpl(this._impl);

  @override
  Future<Either<Failure, GeneralModel>> gigCategory() async {
    try {
      final _response = await _impl.gigCategorySource();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
