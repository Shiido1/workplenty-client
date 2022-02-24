import 'package:client/core/api/gig/gig_api.dart';
import 'package:client/views/dashboard/gig/domain/source/live/saved_source.dart';

import '../model/gigs_response/gigs_response.dart';

class SavedGigListSourceImpl implements SavedGigListSource {
  final GigApi _api;

  SavedGigListSourceImpl({required GigApi api}) : _api = api;

  @override
  Future<GigsResponse> savedGigList() async {
    return await _api.savedGigList();
  }
}
