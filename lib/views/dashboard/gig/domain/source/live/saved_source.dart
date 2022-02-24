import 'package:client/views/dashboard/gig/data/model/saved_gig_list/saved_gig_list.model.dart';

abstract class SavedGigListSource {
  Future<SavedGigList> savedGigList();
}