import 'package:client/core/helper/configs/instances.dart';
import 'package:client/core/viewmodels/base_model.dart';
import 'package:client/views/dashboard/saved/domain/source/local/saved_profile_dao.dart';
import 'package:client/views/dashboard/saved/domain/usecase/saved_profile_list_usecase.dart';

class SaveProfileListProvider extends BaseModel {
  final SavedProfileListUseCase _useCase;

  SaveProfileListProvider(this._useCase);

  Future<void> getSaveProfileList() async {
    try {
      final _response = await _useCase.savedProfileList();
      _response!.fold((l) => logger.e(l.errorMessage(l)),
          (r) => savedProfileListDao!.savedProfileList(r.data?.data));
    } catch (e) {
      throw (e);
    }
  }
}
