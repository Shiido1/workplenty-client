import 'package:client/core/entity/default_response.dart';
import 'package:client/core/error/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/dashboard/gig/data/contractImpl/gigContractImpl.dart';
import 'package:client/views/dashboard/gig/data/model/available_gig_response/available_gig_response.dart';
import 'package:client/views/dashboard/gig/data/model/category_of_gig_response/category_of_gig_response.dart';
import 'package:client/views/dashboard/gig/data/model/details_of_gig_response/details_of_gig_response.dart';
import 'package:client/views/dashboard/gig/data/model/list_of_skills_response/list_of_skills_response.dart';
import 'package:client/views/dashboard/gig/data/model/saved_client_gig_response/saved_client_gig_response.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../entity/gig/gig_entity.dart';

class GigUseCases extends UseCase<DefaultResponse, Params> {
  final GigContractImpl _repository;

  GigUseCases(this._repository);

  @override
  Future<Either<Failure, SavedClientGigResponse>>? saveClientsGig(
      Params params) async {
    return await _repository.saveClientsGig(params.entity!);
  }

  @override
  Future<Either<Failure, DefaultResponse>>? removeAttachment(
      Params params) async {
    return await _repository.removeAttachment(params.entity!);
  }

  @override
  Future<Either<Failure, DefaultResponse>>? savedGigsSave(Params params) async {
    return await _repository.savedGigsSave(params.entity!);
  }

  @override
  Future<Either<Failure, AvailableGigResponse>>? getListOfAvailableGigs(
      Params params) async {
    return await _repository.getListOfAvailableGigs(params.entity!);
  }

  @override
  Future<Either<Failure, DetailsOfGigResponse>>? getDetailsOfGig(
      Params params) async {
    return await _repository.getDetailsOfGig(params.entity!);
  }

  @override
  Future<Either<Failure, CategoryOfGigResponse>>? categoriesOfGig() async {
    return await _repository.categoriesOfGig();
  }

  @override
  Future<Either<Failure, ListOfSkillsResponse>>? listOfSkills() async {
    return await _repository.listOfSkills();
  }
}

class Params extends Equatable {
  final GigEntity? entity;

  const Params({required this.entity});

  @override
  List<Object?> get props => [entity!];
}
