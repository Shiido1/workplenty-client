import 'package:client/core/api/gig/gig_api.dart';
import 'package:client/core/general_model/general_model/general_model.dart';
import 'package:client/views/dashboard/gig/gigs/domain/source/gig_category_source.dart';

class GigCategorySourcesImpl implements GigCategorySource {
  final GigApi _api;

  GigCategorySourcesImpl({required GigApi api}) : _api = api;

  @override
  Future<GeneralModel> gigCategorySource() async {
    return await _api.gigCategory();
  }
}
