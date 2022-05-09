import 'package:client/core/error/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/dashboard/gig/data/contractImpl/artisanContractImpl.dart';
import 'package:client/views/dashboard/gig/data/model/gigs_response/gigs_response.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../entity/gig/gig_entity.dart';

class ArtisanUseCase extends UseCase<GigsResponse, Params> {
  final ArtisanContractImpl _repository;

  ArtisanUseCase(this._repository);

  @override
  Future<Either<Failure, GigsResponse>>? listOfArtisan(Params p) async =>
      await _repository.listOfArtisans(entity: p.entity);
}

class Params extends Equatable {
  final GigEntity? entity;

  const Params({required this.entity});

  @override
  List<Object?> get props => [entity!];
}
