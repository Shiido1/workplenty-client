import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../data/model/saved_gig_list/saved_gig_list.model.dart';

abstract class SavedGigListContract {
  Future<Either<Failure, SavedGigList>> saveGigList();
}