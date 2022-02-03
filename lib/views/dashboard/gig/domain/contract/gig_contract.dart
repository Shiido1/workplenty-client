import 'package:client/core/error/failures.dart';
import 'package:client/views/dashboard/gig/data/model/remove_attachment_response/remove_attachment_response.dart';
import 'package:client/views/dashboard/gig/data/model/save_gig_response/save_gig_response.dart';
import 'package:client/views/dashboard/gig/domain/entity/gig/gig_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GigContract {
  Future<Either<Failure, SaveGigResponse>> saveGig(GigEntity entity);
  Future<Either<Failure, RemoveAttachmentResponse>> removeAttachment(
      GigEntity entity);
}
