import '../../../../../core/helper/configs/instances.dart';
import '../../../../../core/viewmodels/base_model.dart';
import '../../domain/usecase/finance_usecase.dart';

class FinanceProvider extends BaseModel {
  final FinanceUseCase _useCase;

  FinanceProvider(this._useCase);

  void walletBalance() async {
    try {
      /// show loading indcator if card local database is empty
      final _response = await _useCase.walletBalanceUseCase();
      _response!.fold((l) => logger.e(l.errorMessage(l)),
          (r) => logger.i('Save Item To Local DB: ${r.data?.currentBalance}'));
    } catch (e) {}
  }

  void walletTransaction() async {
    try {
      /// show loading indcator if card local database is empty
      final _response = await _useCase.walletTransactionUseCase();
      _response!.fold((l) => logger.e(l.errorMessage(l)),
          (r) => logger.i('Save Item To Local DB: ${r.data?.data?.length}'));
    } catch (e) {}
  }
}