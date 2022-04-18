import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/chat_entity.dart';
import '../../domain/usecase/chat_usecase.dart';

part 'chat_message_send_bloc_event.dart';
part 'chat_message_send_bloc_state.dart';

class ChatMessageSendBlocBloc
    extends Bloc<ChatMessageSendBlocEvent, ChatBlocState> {
  final ChatUseCase _useCase;
  ChatMessageSendBlocBloc(this._useCase) : super(ChatBlocInitial()) {
    on<ChatMessageSendBlocEvent>((event, emit) async {
      // chat message event

      if (event is ChatMessageSend) {
        try {
          emit(ChatBlocLoading());
          final _response = await _useCase
              .chatMessageSendUseCase(Params(entity: event.entity));
          _response.fold(
              (l) => emit(ChatBlocFailed(message: l.errorMessage(l)!)),
              (r) => emit(ChatMessageSendBlocSuccess(response: r)));
        } catch (e) {
          emit(ChatBlocFailed(message: e.toString()));
        }
      }
      // chat initiate event

      if (event is ChatInitiate) {
        try {
          emit(ChatBlocLoading());
          final _response = await _useCase
              .chatMessageSendUseCase(Params(entity: event.entity));
          _response.fold(
              (l) => emit(ChatBlocFailed(message: l.errorMessage(l)!)),
              (r) => emit(ChatInitiateBlocSuccess(response: r)));
        } catch (e) {
          emit(ChatBlocFailed(message: e.toString()));
        }
      }
    });
  }
}
