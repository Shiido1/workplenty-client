import 'package:bloc/bloc.dart';
import 'package:client/views/onboarding/domain/entity/payment/deposit_entity.dart';
import 'package:client/views/onboarding/domain/usecases/payment_deposit_usecase.dart';
import 'package:equatable/equatable.dart';

part 'payment_deposit_bloc_event.dart';
part 'payment_deposit_bloc_state.dart';

class PaymentDepositBlocBloc
    extends Bloc<PaymentDepositBlocEvent, PaymentDepositBlocState> {
  final PaymentDepositCases _useCases;

  PaymentDepositBlocBloc(this._useCases) : super(PaymentDepositBlocInitial()) {
    on<PaymentDepositBlocEvent>((event, emit) async {
      // / Payment Deposit Event
      if (event is PaymentDepositEvent) {
        try {
          emit(PaymentDepositBlocLoading());
          final _response =
              await _useCases.depositPayment(Params(entity: event.entity));
          _response.fold(
              (l) =>
                  emit(PaymentDepositBlocFailed(message: l.errorMessage(l)!)),
              (r) => emit(PaymentDepositBlocSuccess(response: r)));
        } catch (e) {
          emit(PaymentDepositBlocFailed(message: e.toString()));
        }
      }
    });
  }
}
