import 'package:client/views/dashboard/gig/domain/entity/gig/gig_entity.dart';

import '../../../../../core/entity/default_response.dart';
import '../../data/model/available_gig_response/available_gig_response.dart';
import '../../data/model/category_of_gig_response/category_of_gig_response.dart';
import '../../data/model/details_of_gig_response/details_of_gig_response.dart';
import '../../data/model/list_of_skills_response/list_of_skills_response.dart';
import '../../data/model/saved_client_gig_response/saved_client_gig_response.dart';

abstract class GigSource {
  Future<SavedClientGigResponse> saveClientsGig(GigEntity entity);
  Future<DefaultResponse> removeAttachment(GigEntity entity);
  Future<DefaultResponse> savedGigsSave(GigEntity entity);
  Future<AvailableGigResponse> getListOfAvailableGigs(GigEntity entity);
  Future<DetailsOfGigResponse> getDetailsOfGig(GigEntity entity);
  Future<CategoryOfGigResponse> categoriesOfGig();
  Future<ListOfSkillsResponse> listOfSkills();
}
