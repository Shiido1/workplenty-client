import 'package:client/core/error/failures.dart';
import 'package:client/core/general_model/general_model/general_model.dart';
import 'package:dartz/dartz.dart';

abstract class GigDetailContract {
  Future<Either<Failure, GeneralModel>> gigDetail();
}
