import 'package:client/views/dashboard/gig/domain/source/local/saved_gig_dao.dart';
import 'package:client/views/dashboard/gig/domain/usecase/saved_gig_list_usecase.dart';

import '../../../../../core/helper/configs/instances.dart';
import '../../../../../core/viewmodels/base_model.dart';

class SavedGigListProvider extends BaseModel {
  final SavedGigListUseCase _useCase;

  SavedGigListProvider(this._useCase);

  void savedGigList() async {
    try {
      final _response = await _useCase.listOfSavedGigs();
      logger.d(_response);
      _response!.fold((l) => logger.e(l.errorMessage(l)), (r) {
        savedGigDao?.savedGigList(r.data?.data ?? []);
        logger.d(' gor u messageb ${r.data?.data?.length ?? []}');
      });
    } catch (e) {
      logger.e('An error occured: $e');
    }
  }
}
