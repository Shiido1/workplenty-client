import 'package:client/core/general_model/general_model/general_model.dart';
import 'package:client/core/error/failures.dart';
import 'package:client/views/dashboard/gig/data/sourceImpl/saved_gig_save_source_impl.dart';
import 'package:client/views/dashboard/gig/domain/contract/saved_gig_save_contract.dart';
import 'package:dartz/dartz.dart';
import 'package:client/views/dashboard/gig/domain/entity/saved_gig-save_entity.dart';

class SavedGigSaveContractimpl implements SavedGigSaveContract {
  final SavedGigSaveSourceimpl _impl;

  SavedGigSaveContractimpl(this._impl);

  @override
  Future<Either<Failure, GeneralModel>> savedGigSave(
      SavedGigSaveEntity entity) async {
    try {
      final _response = await _impl.savedGigSave(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
