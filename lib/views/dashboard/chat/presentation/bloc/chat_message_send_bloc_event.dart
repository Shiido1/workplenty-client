part of 'chat_message_send_bloc_bloc.dart';

abstract class ChatMessageSendBlocEvent extends Equatable {
  const ChatMessageSendBlocEvent();

  @override
  List<Object> get props => [];
}

class ChatMessageSend extends ChatMessageSendBlocEvent {
  final ChatEntity entity;

  const ChatMessageSend(this.entity);
}

class ChatInitiate extends ChatMessageSendBlocEvent {
  final ChatEntity entity;

  const ChatInitiate(this.entity);
}
