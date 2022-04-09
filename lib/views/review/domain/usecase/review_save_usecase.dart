import 'package:client/core/entity/default_response.dart';
import 'package:client/core/error/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/review/data/contractImpl/review_contract_impl.dart';
import 'package:client/views/review/domain/entity/review_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SaveReviewUsesCases extends UseCase<DefaultResponse, Params> {
  final ReviewContractImpl _repository;

  SaveReviewUsesCases(this._repository);

  @override
  Future<Either<Failure, DefaultResponse>> reviewSave(Params params) async {
    return await _repository.reviewSave(params.entity!);
  }
}

class Params extends Equatable {
  final ReviewEntity? entity;

  const Params({required this.entity});

  @override
  List<Object> get props => [entity!];
}
