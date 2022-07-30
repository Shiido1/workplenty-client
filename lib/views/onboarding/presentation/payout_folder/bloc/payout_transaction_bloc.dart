import 'package:bloc/bloc.dart';
import 'package:client/views/onboarding/domain/entity/payment/payout_entity.dart';
import 'package:client/views/onboarding/domain/usecases/payment_usecase.dart';
import 'package:equatable/equatable.dart';

part 'payout_transaction_event.dart';
part 'payout_transaction_state.dart';

class PayoutTransactionBloc
    extends Bloc<PayoutTransactionEvent, PayoutTransactionState> {
  final PaymentUsecase _usecase;
  PayoutTransactionBloc(this._usecase) : super(PayoutTransactionInitial()) {
    on<PayoutTransactionEvent>((event, emit) async {
      if (event is StartPayoutTransactionEvent) {
        try {
          emit(PayoutTransactionLoading());
          final _response =
              await _usecase.payoutUsecase(Params(entity: event.entity));
          _response!.fold(
              (l) => emit(PayoutTransactionFailed(message: l.errorMessage(l)!)),
              (r) => emit(PayoutTransactionSuccessful(response: r)));
        } catch (e) {
          emit(PayoutTransactionFailed(message: e.toString()));
        }
      }
    });
  }
}
