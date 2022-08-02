import 'package:client/core/helper/configs/instances.dart';
import 'package:client/core/viewmodels/base_model.dart';
import 'package:client/views/dashboard/card/data/model/card_response/datum.dart';
import 'package:client/views/dashboard/card/domain/usecase/card_usecase.dart';

import '../../../../../core/enums/viewstate.dart';

class CardProvider extends BaseModel {
  final CardUseCase _useCase;
  List<Datum>? cardData;

  CardProvider(this._useCase);

  void getAllCards() async {
    try {

      setState(ViewState.busy, triggerListener: false);
      /// show loading indcator if card local database is empty
      final _response = await _useCase.getAllCardUseCase();
      _response!.fold((l) => logger.e(l.errorMessage(l)), (r) {
        cardData = r.data;
      });
      
    } catch (e) {
      setState(ViewState.idle, triggerListener: true);
    }

      setState(ViewState.idle, triggerListener: true);
  }
}
