import 'package:client/core/api/gig/gig_api.dart';
import 'package:client/views/dashboard/gig/domain/entity/gig/gig_entity.dart';
import 'package:client/views/dashboard/gig/data/model/saved_client_gig_response/saved_client_gig_response.dart';
import 'package:client/views/dashboard/gig/data/model/list_of_skills_response/list_of_skills_response.dart';
import 'package:client/views/dashboard/gig/data/model/details_of_gig_response/details_of_gig_response.dart';
import 'package:client/views/dashboard/gig/data/model/category_of_gig_response/category_of_gig_response.dart';
import 'package:client/views/dashboard/gig/data/model/available_gig_response/available_gig_response.dart';
import 'package:client/core/entity/default_response.dart';
import 'package:client/views/dashboard/gig/domain/source/live/gig_source.dart';

class GigSourceImpl implements GigSource {
  final GigApi _api;

  GigSourceImpl({required GigApi api}) : _api = api;

  @override
  Future<CategoryOfGigResponse> categoriesOfGig() async {
    return await _api.categoriesOfGig();
  }

  @override
  Future<DetailsOfGigResponse> getDetailsOfGig(GigEntity entity) async {
    return await _api.getDetailsOfGig(entity: entity);
  }

  @override
  Future<AvailableGigResponse> getListOfAvailableGigs(GigEntity entity) async {
    return await _api.getListOfAvailableGigs(entity: entity);
  }

  @override
  Future<ListOfSkillsResponse> listOfSkills() async {
    return await _api.listOfSkills();
  }

  @override
  Future<DefaultResponse> removeAttachment(GigEntity entity) async {
    return await _api.removeAttachment(entity);
  }

  @override
  Future<SavedClientGigResponse> saveClientsGig(GigEntity entity) async {
    return await _api.saveClientsGig(entity);
  }

  @override
  Future<DefaultResponse> savedGigsSave(GigEntity entity) async {
    return await _api.savedGigsSave(entity);
  }
}
