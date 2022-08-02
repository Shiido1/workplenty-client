import 'package:bloc/bloc.dart';
import 'package:client/views/dashboard/card/domain/usecase/card_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/card_entity.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final CardUseCase _usecase;
  CardBloc(this._usecase) : super(CardInitialState()) {
    on<CardEvent>((event, emit) async {
      if (event is StartCardEvent) {
        try {
          emit(CardLoadingState());
          final _response =
              await _usecase.saveCard(Params(entity: event.entity));
          _response!.fold(
              (l) => emit(CardFailedState(message: l.errorMessage(l)!)),
              (r) => emit(CardSuccessState(response: r)));
        } catch (e) {
          emit(CardFailedState(message: e.toString()));
        }
      }

      if (event is StartCardRemoveEvent) {
        try {
          emit(CardLoadingState());
          final _response =
              await _usecase.removeCard(Params(entity: event.entity));
          _response!.fold(
              (l) => emit(CardFailedState(message: l.errorMessage(l)!)),
              (r) => emit(CardRemoveSuccessState(response: r)));
        } catch (e) {
          emit(CardFailedState(message: e.toString()));
        }
      }
    });
  }
}
