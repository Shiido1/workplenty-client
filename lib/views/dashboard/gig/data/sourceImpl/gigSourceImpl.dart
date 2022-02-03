import 'package:client/core/api/gig/gig_api.dart';
import 'package:client/views/dashboard/gig/data/model/remove_attachment_response/remove_attachment_response.dart';
import 'package:client/views/dashboard/gig/data/model/save_gig_response/save_gig_response.dart';
import 'package:client/views/dashboard/gig/domain/entity/gig/gig_entity.dart';
import 'package:client/views/dashboard/gig/domain/source/gig_source.dart';

class GigSourceImpl implements GigSource {
  final GigApi _api;

  GigSourceImpl({required GigApi api}) : _api = api;

  @override
  Future<RemoveAttachmentResponse> removeAttachment(GigEntity entity) async {
    return await _api.removeAttachment(entity);
  }

  @override
  Future<SaveGigResponse> saveGig(GigEntity entity) async {
    return await _api.saveGig(entity);
  }
}
