import 'package:bloc/bloc.dart';
import 'package:client/views/review/domain/entity/review_entity.dart';
import 'package:client/views/review/domain/usecase/review_save_usecase.dart';
import 'package:equatable/equatable.dart';

part 'review_bloc_event.dart';
part 'review_bloc_state.dart';

class ReviewBlocBloc extends Bloc<ReviewBlocEvent, ReviewBlocState> {
  final SaveReviewUsesCases _useCases;
  
  ReviewBlocBloc(this._useCases) : super(ReviewBlocInitial()) {
    on<ReviewBlocEvent>((event, emit) async {
      if (event is SaveReviewEvent) {
        try {
          emit(ReviewBlocLoading());
          final _response =
              await _useCases.reviewSave(Params(entity: event.entity));
          _response.fold(
              (l) => emit(ReviewBlocFailed(message: l.errorMessage(l)!)),
              (r) => emit(ReviewBlocSuccess(response: r)));
        } catch (e) {
          emit(ReviewBlocFailed(message: e.toString()));
        }
      }
    });
  }
}
