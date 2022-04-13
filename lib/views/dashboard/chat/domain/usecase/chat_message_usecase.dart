

import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/dashboard/chat/data/contractImpl/chat_message_contract_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../data/model/mesage_response/mesage_response.dart';
import '../entity/chat_message_entity.dart';

class ChatMessageUseCase extends UseCase<MessageEntity,Params> {
 final ChatMessageContractImpl _chatMessageContractImpl;

  ChatMessageUseCase(this._chatMessageContractImpl);

  @override
  Future<Either<Failure, MesageResponse>> chatMessageListUseCase(
      Params params) async {
    return await _chatMessageContractImpl.chatMessageList(params.messageEntity!);
  }

  @override
  Future<Either<Failure, MesageResponse>> chatMessageSendUseCase(
      Params params) async {
    return await _chatMessageContractImpl.chatMessageSend(params.messageEntity!);
  }
}

class Params extends Equatable {
  final MessageEntity? messageEntity;

  const Params(this.messageEntity);

  @override
  List<Object?> get props => [messageEntity!];
}