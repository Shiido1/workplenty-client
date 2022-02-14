import 'package:bloc/bloc.dart';
import 'package:client/views/dashboard/saved/domain/usecase/saved_profile_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/saved_profile_entity.dart';

part 'saved_profile_bloc_event.dart';
part 'saved_profile_bloc_state.dart';

class SavedProfileBlocBloc
    extends Bloc<SavedProfileBlocEvent, SavedProfileBlocState> {
  final SavedProfileUseCase _useCase;

  SavedProfileBlocBloc(this._useCase) : super(SavedProfileBlocInitial()) {
    on<SavedProfileBlocEvent>((event, emit) async {
      if (event is SavedProfileEvent) {
        try {
          emit(SavedProfileblocLoading());
          final _response =
              await _useCase.savedProfile(Params(entity: event.entity));
          _response!.fold(
              (l) => emit(SavedProfileblocFailed(message: l.errorMessage(l)!)),
              (r) => emit(SavedProfileblocSuccess(response: r)));
        } catch (e) {
          emit(SavedProfileblocFailed(message: e.toString()));
        }
      }
    });
  }
}
