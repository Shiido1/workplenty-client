import 'package:client/core/api/gig/gig_api.dart';
import 'package:client/views/dashboard/gig/data/model/saved_gig_list/saved_gig_list.model.dart';
import 'package:client/views/dashboard/gig/domain/source/live/saved_source.dart';

class SavedGigListSourceImpl implements SavedGigListSource {
  final GigApi _api;

  SavedGigListSourceImpl({required GigApi api}) : _api = api;

  @override
  Future<SavedGigList> savedGigList() async{
    return await _api.savedGigList();
  }
}