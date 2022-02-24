import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../data/model/available_gig_response/available_gig_response.dart';
import '../../data/model/list_of_artisan_response/list_of_artisan_response.dart';
import '../../data/model/saved_gig_list/saved_gig_list.model.dart';

abstract class SavedGigListContract {
  Future<Either<Failure, ListOfArtisanResponse>> saveGigList();
}