import 'package:client/core/error/failures.dart';
import 'package:client/core/general_model/general_model/general_model.dart';
import 'package:client/views/dashboard/gig/domain/entity/saved_gig-save_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SavedGigSaveContract {
  Future<Either<Failure, GeneralModel>> savedGigSave(SavedGigSaveEntity entity);
}
