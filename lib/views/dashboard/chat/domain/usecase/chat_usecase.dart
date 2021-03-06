import 'package:client/core/error/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/views/dashboard/chat/data/contractImpl/chatContractImpl.dart';
import 'package:client/views/dashboard/chat/data/model/chat_list_response/chat_list_response.dart';
import 'package:client/views/dashboard/chat/domain/entity/chat_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/mesage_response/mesage_response.dart';

class ChatUseCase extends UseCase<ChatEntity, Params> {
  final ChatContractImpl _chatContractImpl;

  ChatUseCase(this._chatContractImpl);

  @override
  Future<Either<Failure, ChatListResponse>>? chatListUseCase() async {
    return await _chatContractImpl.chatList();
  }

  @override
  Future<Either<Failure, MesageResponse>> chatMessageListUseCase(
      Params params) async {
    return await _chatContractImpl.chatMessageList(params.entity!);
  }

  @override
  Future<Either<Failure, MesageResponse>> chatMessageSendUseCase(
      Params params) async {
    return await _chatContractImpl.chatMessageSend(params.entity!);
  }
}

class Params extends Equatable {
  final ChatEntity? entity;

  const Params({required this.entity});

  @override
  List<Object?> get props => [entity!];
}
