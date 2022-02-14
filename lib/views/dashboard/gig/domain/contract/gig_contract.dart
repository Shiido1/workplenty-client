import 'package:client/core/entity/default_response.dart';
import 'package:client/core/error/failures.dart';
import 'package:client/views/dashboard/gig/data/model/available_gig_response/available_gig_response.dart';
import 'package:client/views/dashboard/gig/data/model/category_of_gig_response/category_of_gig_response.dart';
import 'package:client/views/dashboard/gig/data/model/details_of_gig_response/details_of_gig_response.dart';
import 'package:client/views/dashboard/gig/data/model/list_of_skills_response/list_of_skills_response.dart';
import 'package:client/views/dashboard/gig/data/model/saved_client_gig_response/saved_client_gig_response.dart';

import 'package:client/views/dashboard/gig/domain/entity/gig/gig_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GigContract {
  Future<Either<Failure, SavedClientGigResponse>> saveClientsGig(
      GigEntity entity);
  Future<Either<Failure, DefaultResponse>> removeAttachment(GigEntity entity);
  Future<Either<Failure, DefaultResponse>> savedGigsSave(GigEntity entity);
  Future<Either<Failure, AvailableGigResponse>> getListOfAvailableGigs(
      GigEntity entity);
  Future<Either<Failure, DetailsOfGigResponse>> getDetailsOfGig(
      GigEntity entity);
  Future<Either<Failure, CategoryOfGigResponse>> categoriesOfGig();
  Future<Either<Failure, ListOfSkillsResponse>> listOfSkills();
}
