import 'package:client/core/error/failures.dart';
import 'package:client/views/onboarding/data/model/gig/remove_attachment_response/remove_attachment_response.dart';
import 'package:client/views/onboarding/data/model/gig/save_gig_response/save_gig_response.dart';
import 'package:client/views/onboarding/data/sourceImpl/gigSourceImpl.dart';
import 'package:client/views/onboarding/domain/contract/gig_contract.dart';
import 'package:dartz/dartz.dart';

class GigContractImpl implements GigContract {
  final GigSourceImpl _impl;

  GigContractImpl(this._impl);

  @override
  Future<Either<Failure, RemoveAttachmentResponse>> removeAttachment(
      entity) async {
    try {
      final _response = await _impl.removeAttachment(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SaveGigResponse>> saveGig(entity) async {
    try {
      final _response = await _impl.saveGig(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
