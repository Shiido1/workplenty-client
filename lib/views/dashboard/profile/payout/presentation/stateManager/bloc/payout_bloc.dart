import 'package:bloc/bloc.dart';
import 'package:client/views/onboarding/domain/usecases/payment_usecase.dart';
import 'package:equatable/equatable.dart';

part 'payout_event.dart';
part 'payout_state.dart';

class PayoutBloc extends Bloc<PayoutEvent, PayoutState> {
  final PaymentUsecase _paymentUsecase;

  PayoutBloc(this._paymentUsecase) : super(PayoutInitial()) {
    on<PayoutEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
