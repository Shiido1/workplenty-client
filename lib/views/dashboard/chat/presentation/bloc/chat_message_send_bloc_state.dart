part of 'chat_message_send_bloc_bloc.dart';

abstract class ChatMessageSendBlocState extends Equatable {
  const ChatMessageSendBlocState();

  @override
  List<Object> get props => [];
}

class ChatMessageSendBlocInitial extends ChatMessageSendBlocState {}

class ChatMessageSendBlocLoading extends ChatMessageSendBlocState {}

class ChatMessageSendBlocFailed extends ChatMessageSendBlocState {
  final String message;

  ChatMessageSendBlocFailed({required this.message});
}

class ChatMessageSendBlocSuccess extends ChatMessageSendBlocState {
  dynamic response;
  ChatMessageSendBlocSuccess({required this.response});
}
