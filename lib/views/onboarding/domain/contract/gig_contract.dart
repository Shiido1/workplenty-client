import 'package:client/core/error/failures.dart';
import 'package:client/views/onboarding/data/model/gig/remove_attachment_response/remove_attachment_response.dart';
import 'package:client/views/onboarding/data/model/gig/save_gig_response/save_gig_response.dart';
import 'package:client/views/onboarding/domain/entity/gig/gig_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GigContract {
  Future<Either<Failure, SaveGigResponse>> saveGig(GigEntity entity);
  Future<Either<Failure, RemoveAttachmentResponse>> removeAttachment(
      GigEntity entity);
}
