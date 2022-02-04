import 'package:bloc/bloc.dart';
import 'package:client/views/dashboard/gig/domain/entity/saved_gig-save_entity.dart';
import 'package:client/views/dashboard/gig/domain/usecase/saved_gig_save_usecase.dart';
import 'package:equatable/equatable.dart';

part 'saved_gig_save_state.dart';
part 'saved_gig_save_event.dart';

class SavedGigSaveBloc extends Bloc<SavedGigSaveEvent, SavedGigSaveState> {
  final SavedGigSaveUseCases _savedGigSaveUseCases;

  SavedGigSaveBloc(this._savedGigSaveUseCases)
      : super(SavedGigSaveblocInitial()) {
    on<SavedGigSaveEvent>((event, emit) async {
      if (event is StartSavedGigSaveEvent) {
        try {
          emit(SavedGigSaveblocLoading());
          final _response = await _savedGigSaveUseCases
              .savedGigSaveUseCase(Params(entity: event.entity));
          _response!.fold(
              (l) => emit(SavedGigSaveblocFailed(message: l.errorMessage(l)!)),
              (r) => emit(SavedGigSaveblocSuccess(response: r)));
        } catch (e) {
          emit(SavedGigSaveblocFailed(message: e.toString()));
        }
      }
    });
  }
}
