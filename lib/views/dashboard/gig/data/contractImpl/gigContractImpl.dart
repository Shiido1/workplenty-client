import 'package:client/core/entity/default_response.dart';
import 'package:client/core/error/failures.dart';
import 'package:client/views/dashboard/gig/data/model/general_list_of_industry_response/general_list_of_industry_response.dart';
import 'package:client/views/dashboard/gig/data/model/list_of_skills_response/list_of_skills_response.dart';
import 'package:client/views/dashboard/gig/data/model/details_of_gig_response/details_of_gig_response.dart';
import 'package:client/views/dashboard/gig/data/model/category_of_gig_response/category_of_gig_response.dart';
import 'package:client/views/dashboard/gig/data/model/available_gig_response/available_gig_response.dart';
import 'package:client/views/dashboard/gig/data/model/saved_client_gig_response/saved_client_gig_response.dart';
import 'package:client/views/dashboard/gig/data/sourceImpl/gigSourceImpl.dart';
import 'package:client/views/dashboard/gig/domain/contract/gig_contract.dart';
import 'package:dartz/dartz.dart';
import 'package:client/views/dashboard/gig/domain/entity/gig/gig_entity.dart';

class GigContractImpl implements GigContract {
  final GigSourceImpl _impl;

  GigContractImpl(this._impl);

  @override
  Future<Either<Failure, CategoryOfGigResponse>> categoriesOfGig() async {
    try {
      final _response = await _impl.categoriesOfGig();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DetailsOfGigResponse>> getDetailsOfGig(
      GigEntity entity) async {
    try {
      final _response = await _impl.getDetailsOfGig(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AvailableGigResponse>> getListOfAvailableGigs(
      GigEntity entity) async {
    try {
      final _response = await _impl.getListOfAvailableGigs(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ListOfSkillsResponse>> listOfSkills() async {
    try {
      final _response = await _impl.listOfSkills();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DefaultResponse>> removeAttachment(
      GigEntity entity) async {
    try {
      final _response = await _impl.removeAttachment(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SavedClientGigResponse>> saveClientsGig(
      GigEntity entity) async {
    try {
      final _response = await _impl.saveClientsGig(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DefaultResponse>> savedGigsSave(
      GigEntity entity) async {
    try {
      final _response = await _impl.savedGigsSave(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GeneralListOfIndustryResponse>>
      generalIndustryList() async {
    try {
      final _response = await _impl.generalIndustryList();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
