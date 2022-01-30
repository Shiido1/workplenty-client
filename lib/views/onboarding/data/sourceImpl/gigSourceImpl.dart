import 'package:client/core/api/gig/gig_api.dart';
import 'package:client/views/onboarding/data/model/gig/remove_attachment_response/remove_attachment_response.dart';
import 'package:client/views/onboarding/data/model/gig/save_gig_response/save_gig_response.dart';
import 'package:client/views/onboarding/domain/entity/gig/gig_entity.dart';
import 'package:client/views/onboarding/domain/source/gig_source.dart';

class GigSourceImpl implements GigSource {
  final GigApi _api;

  GigSourceImpl({required GigApi api}) : _api = api;

  @override
  Future<SaveGigResponse> saveGig(GigEntity entity) async {
    return await _api.saveGig(entity);
  }

  @override
  Future<RemoveAttachmentResponse> removeAttachment(GigEntity entity) async {
    return await _api.removeAttachment(entity);
  }
}
