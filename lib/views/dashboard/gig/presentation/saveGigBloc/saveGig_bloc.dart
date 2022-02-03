import 'package:bloc/bloc.dart';
import 'package:client/views/dashboard/gig/domain/entity/gig/gig_entity.dart';
import 'package:client/views/dashboard/gig/domain/usecase/gig_usecase.dart';
import 'package:equatable/equatable.dart';

part 'saveGig_state.dart';
part 'saveGig_event.dart';

class SaveGigBloc extends Bloc<SaveGigEvent, SaveGigState> {
  final GigUseCases _gigUseCases;

  SaveGigBloc(this._gigUseCases) : super(SaveGigblocInitial()) {
    on<SaveGigEvent>((event, emit) async {
      if (event is StartSaveGigEvent) {
        try {
          emit(SaveGigblocLoading());
          final _response =
              await _gigUseCases.saveGigUseCase(Params(entity: event.entity));
          _response.fold(
              (l) => emit(SaveGigblocFailed(message: l.errorMessage(l)!)),
              (r) => emit(SaveGigblocSuccess(response: r)));
        } catch (e) {
          emit(SaveGigblocFailed(message: e.toString()));
        }
      }
    });
  }
}
