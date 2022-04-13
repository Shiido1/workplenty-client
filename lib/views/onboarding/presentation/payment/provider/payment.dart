import 'package:client/core/viewmodels/base_model.dart';
import 'package:client/views/onboarding/data/contractImpl/paymentContractImpl.dart';

import '../../../../../core/helper/configs/instances.dart';

class PaymentProvider extends BaseModel {
  final PaymentContractImpl _paymentContractImpl;

  PaymentProvider(this._paymentContractImpl);

  Future<void> getOverview() async {
    try {
      final _response = await _paymentContractImpl.overviewPayment();
      _response.fold(
          (l) => logger.e(l.errorMessage(l)), (r) => logger.i(r.msg));
    } catch (e) {
      throw (e);
    }
  }

  Future<void> getTransaction() async {
    try {
      final _response = await _paymentContractImpl.transactionPayment();
      _response.fold(
          (l) => logger.e(l.errorMessage(l)), (r) => logger.i(r.msg));
    } catch (e) {
      throw (e);
    }
  }
}
