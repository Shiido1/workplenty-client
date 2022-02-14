import 'package:bloc/bloc.dart';
import 'package:client/views/dashboard/gig/domain/entity/gig/gig_entity.dart';
import 'package:client/views/dashboard/gig/domain/usecase/gig_usecase.dart';
import 'package:equatable/equatable.dart';

part 'servicebloc_event.dart';
part 'servicebloc_state.dart';

class ServiceblocBloc extends Bloc<ServiceblocEvent, ServiceblocState> {
  final GigUseCases _useCase;

  ServiceblocBloc(this._useCase) : super(ServiceblocInitial()) {
    on<ServiceblocEvent>((event, emit) async {
      if (event is ServiceEvent) {
        try {
          emit(ServiceblocLoading());
          final _response =
              await _useCase.saveClientsGig(Params(entity: event.entity));
          _response!.fold(
              (l) => emit(ServiceblocFailed(message: l.errorMessage(l)!)),
              (r) => emit(ServiceblocSuccess(response: r)));
        } catch (e) {
          emit(ServiceblocFailed(message: e.toString()));
        }
      }
    });
  }
}
