part of 'chat_message_send_bloc_bloc.dart';

abstract class ChatBlocState extends Equatable {
  const ChatBlocState();

  @override
  List<Object> get props => [];
}

class ChatBlocInitial extends ChatBlocState {}

class ChatBlocLoading extends ChatBlocState {}

class ChatBlocFailed extends ChatBlocState {
  final String message;

  ChatBlocFailed({required this.message});
}

class ChatMessageSendBlocSuccess extends ChatBlocState {
  final dynamic response;
  ChatMessageSendBlocSuccess({required this.response});
}

class ChatInitiateBlocSuccess extends ChatBlocState {
  final dynamic response;
  ChatInitiateBlocSuccess({required this.response});
}
