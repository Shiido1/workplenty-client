import 'package:client/views/dashboard/gig/data/model/remove_attachment_response/remove_attachment_response.dart';
import 'package:client/views/dashboard/gig/data/model/save_gig_response/save_gig_response.dart';
import 'package:client/views/dashboard/gig/domain/entity/gig/gig_entity.dart';

abstract class GigSource {
  Future<SaveGigResponse> saveGig(GigEntity entity);
  Future<RemoveAttachmentResponse> removeAttachment(GigEntity entity);
}
