import 'package:client/core/error/failures.dart';
import 'package:client/core/general_model/general_model/general_model.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/dashboard/gig/data/contractImpl/saved_gig_save_contract_impl.dart';
import 'package:client/views/dashboard/gig/domain/entity/saved_gig-save_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SavedGigSaveUseCases extends UseCase<SavedGigSaveEntity, Params> {
  final SavedGigSaveContractimpl _savedGigSaveContractimpl;

  SavedGigSaveUseCases(this._savedGigSaveContractimpl);

  Future<Either<Failure, GeneralModel>>? savedGigSaveUseCase(
      Params params) async {
    return await _savedGigSaveContractimpl.savedGigSave(params.entity!);
  }
}

class Params extends Equatable {
  final SavedGigSaveEntity? entity;

  const Params({required this.entity});

  @override
  List<Object?> get props => [entity!];
}
