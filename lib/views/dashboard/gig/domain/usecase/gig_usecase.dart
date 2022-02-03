import 'package:client/core/error/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/dashboard/gig/data/contractImpl/gigContractImpl.dart';
import 'package:client/views/dashboard/gig/data/model/save_gig_response/save_gig_response.dart';
import 'package:client/views/dashboard/gig/domain/entity/gig/gig_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GigUseCases extends UseCase<GigEntity, Params> {
  final GigContractImpl _gigContractImpl;

  GigUseCases(this._gigContractImpl);

  @override
  Future<Either<Failure, SaveGigResponse>> saveGigUseCase(Params params) async {
    return await _gigContractImpl.saveGig(params.entity!);
  }
}

class Params extends Equatable {
  final GigEntity? entity;

  const Params({required this.entity});

  @override
  List<Object?> get props => [entity!];
}
