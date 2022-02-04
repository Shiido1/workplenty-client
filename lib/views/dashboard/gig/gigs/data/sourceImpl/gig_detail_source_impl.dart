import 'package:client/core/api/gig/gig_api.dart';
import 'package:client/core/general_model/general_model/general_model.dart';
import 'package:client/views/dashboard/gig/gigs/domain/source/gig_detail_source.dart';

class GigDetailSourcesImpl implements GigDetailSource {
  final GigApi _api;

  GigDetailSourcesImpl({required GigApi api}) : _api = api;

  @override
  Future<GeneralModel> gigDetailSource() async {
    return await _api.gigDetail();
  }
}
