import 'package:client/core/error/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/review/data/contractImpl/review_contract_impl.dart';
import 'package:client/views/review/data/model/review_list_response_model/revie_list_response_model.dart';
import 'package:client/views/review/domain/entity/review_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ReviewUsesCases extends UseCase<RevieListResponseModel, Params> {
  final ReviewContractImpl _repository;

  ReviewUsesCases(this._repository);

  @override
  Future<Either<Failure, RevieListResponseModel>> reviewList(Params params) async {
    return await _repository.reviewList(params.entity!);
  }

}

class Params extends Equatable {
  final ReviewEntity? entity;

  const Params({required this.entity});

  @override
  List<Object> get props => [entity!];
}