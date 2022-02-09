import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/dashboard/saved/data/contractImpl/saved_profile_contract_impl.dart';
import 'package:client/views/dashboard/saved/data/model/saved_profile_response.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../entity/saved_profile_entity.dart';

class SavedProfileUseCase extends UseCase<SavedProfileResponse, Params> {
  final SavedProfileContractImpl _contractImpl;

  SavedProfileUseCase(this._contractImpl);

  @override
  Future<Either<Failure, SavedProfileResponse>>? savedProfile(
      Params params) async {
    return await _contractImpl.savedProfileContract(params.entity!);
  }
}

class Params extends Equatable {
  final SavedProfileEntity? entity;

  const Params({required this.entity});

  @override
  List<Object?> get props => [entity!];
}
