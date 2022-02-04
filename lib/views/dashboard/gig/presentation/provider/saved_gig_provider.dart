import 'package:client/core/helper/configs/instances.dart';
import 'package:client/core/viewmodels/base_model.dart';
import 'package:client/views/dashboard/gig/domain/usecase/saved_gig_usecase.dart';

class SavedGigProvider extends BaseModel {
  final SavedGigUseCases _useCase;

  SavedGigProvider(this._useCase);

  void chatList() async {
    try {
      final _response = await _useCase.savedGigUseCase();
      _response!.fold((l) => logger.e(l.errorMessage(l)),
          (r) => logger.i('Save Item To Local DB: ${r.data?.data?.length}'));
    } catch (e) {}
  }
}
