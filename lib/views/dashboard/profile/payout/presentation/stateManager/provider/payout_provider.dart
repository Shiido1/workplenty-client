import 'package:client/core/enums/viewstate.dart';
import 'package:client/core/helper/configs/instances.dart';
import 'package:client/core/viewmodels/base_model.dart';

import '../../../../../../onboarding/domain/usecases/payment_usecase.dart';
import '../../overview_response/data.dart';

class PayoutProvider extends BaseModel {
  Data? overviewData;

  final PaymentUsecase _usecase;

  PayoutProvider(this._usecase);

  void overview() async {
    try {
      final _response = await _usecase.overviewPayment();
      _response?.fold((l) => logger.e(l.errorMessage(l)), (r) {
        overviewData = r.data;
      });
    } catch (e) {
      setState(ViewState.idle, triggerListener: true);
    }
  }

  void transactions() async {
    try {
      final _response = await _usecase.transactionPayment();
      _response?.fold((l) => logger.e(l.errorMessage(l)), (r) {});
    } catch (e) {
      setState(ViewState.idle, triggerListener: true);
    }
  }

  void walletBallance() {}
}
