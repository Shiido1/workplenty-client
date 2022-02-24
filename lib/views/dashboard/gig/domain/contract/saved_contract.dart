import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../data/model/gigs_response/gigs_response.dart';

abstract class SavedGigListContract {
  Future<Either<Failure, GigsResponse>> saveGigList();
}
