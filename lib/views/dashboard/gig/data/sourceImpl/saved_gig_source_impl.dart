import 'package:client/core/api/gig/gig_api.dart';
import 'package:client/core/general_model/general_model/general_model.dart';
import 'package:client/views/dashboard/gig/domain/source/saved_gig_source.dart';

class SavedGigSourceImpl implements SavedGigSource {
  final GigApi _api;

  SavedGigSourceImpl({required GigApi api}) : _api = api;

  @override
  Future<GeneralModel> savedGig() async {
    return await _api.savedGig();
  }
}
