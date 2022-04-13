import 'package:client/core/helper/configs/instances.dart';
import 'package:client/core/viewmodels/base_model.dart';
import 'package:client/views/dashboard/card/domain/usecase/card_usecase.dart';

class CardProvider extends BaseModel {
  final CardUseCase _useCase;

  CardProvider(this._useCase);

  void getAllCards() async {
    try {
      /// show loading indcator if card local database is empty
      final _response = await _useCase.getAllCardUseCase();
      _response!.fold((l) => logger.e(l.errorMessage(l)),
          (r) => logger.i('Save Item To Local DB: ${r.msg}'));
    } catch (e) {}
  }

}
