import 'package:client/views/dashboard/saved/data/model/saved_profile_list_response/saved_profile_model_response/saved_profile_model_response.dart';
import 'package:client/views/dashboard/saved/data/model/saved_profile_response.dart';
import 'package:client/core/error/failures.dart';
import 'package:client/views/dashboard/saved/domain/contract/saved_profile_contract.dart';
import 'package:dartz/dartz.dart';
import 'package:client/views/dashboard/saved/domain/entity/saved_profile_entity.dart';
import '../sourceImpl/saved_profile_source_impl.dart';

class SavedProfileContractImpl implements SavedProfileContract {
  final SavedProfileSourceImpl _impl;

  SavedProfileContractImpl(this._impl);

  @override
  Future<Either<Failure, SavedProfileResponse>> savedProfileContract(
      SavedProfileEntity entity) async {
    try {
      final _response = await _impl.savedProfileSource(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SavedProfileModelResponse>>
      savedProfileListContract() async {
    try {
      final _response = await _impl.savedProfileListSource();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
