import 'package:client/core/api/gig/gig_api.dart';
import 'package:client/views/dashboard/gig/data/model/saved_gig_list/saved_gig_list.model.dart';
import 'package:client/views/dashboard/gig/domain/source/live/saved_source.dart';

import '../model/available_gig_response/available_gig_response.dart';
import '../model/list_of_artisan_response/list_of_artisan_response.dart';

class SavedGigListSourceImpl implements SavedGigListSource {
  final GigApi _api;

  SavedGigListSourceImpl({required GigApi api}) : _api = api;

  @override
  Future<ListOfArtisanResponse> savedGigList() async{
    return await _api.savedGigList();
  }
}