import 'package:client/views/onboarding/data/model/gig/remove_attachment_response/remove_attachment_response.dart';
import 'package:client/views/onboarding/data/model/gig/save_gig_response/save_gig_response.dart';
import 'package:client/views/onboarding/domain/entity/gig/gig_entity.dart';

abstract class GigSource {
  Future<SaveGigResponse> saveGig(GigEntity entity);
  Future<RemoveAttachmentResponse> removeAttachment(GigEntity entity);
}
