import 'package:client/core/error/failures.dart';
import 'package:client/views/dashboard/saved/data/model/saved_profile_list_response/saved_profile_model_response/saved_profile_model_response.dart';
import 'package:client/views/dashboard/saved/data/model/saved_profile_response.dart';
import 'package:dartz/dartz.dart';

import '../entity/saved_profile_entity.dart';

abstract class SavedProfileContract {
  Future<Either<Failure, SavedProfileResponse>> savedProfileContract(
      SavedProfileEntity entity);
  Future<Either<Failure, SavedProfileModelResponse>> savedProfileListContract();
}
