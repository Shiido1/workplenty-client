import 'package:bloc/bloc.dart';
import 'package:client/views/dashboard/chat/domain/entity/chat_message_entity.dart';
import 'package:client/views/dashboard/chat/domain/usecase/chat_message_usecase.dart';
import 'package:equatable/equatable.dart';

part 'chat_message_send_bloc_event.dart';
part 'chat_message_send_bloc_state.dart';

class ChatMessageSendBlocBloc
    extends Bloc<ChatMessageSendBlocEvent, ChatMessageSendBlocState> {
  final ChatMessageUseCase _useCase;
  ChatMessageSendBlocBloc(this._useCase) : super(ChatMessageSendBlocInitial()) {
    on<ChatMessageSendBlocEvent>((event, emit) async {
      // chat message event

      if (event is ChatMessageSend) {
        try {
          emit(ChatMessageSendBlocLoading());
          final _response =
              await _useCase.chatMessageSendUseCase(Params(event.entity));
          _response.fold(
              (l) =>
                  emit(ChatMessageSendBlocFailed(message: l.errorMessage(l)!)),
              (r) => emit(ChatMessageSendBlocSuccess(response: r)));
        } catch (e) {
          emit(ChatMessageSendBlocFailed(message: e.toString()));
        }
      }
    });
  }
}
