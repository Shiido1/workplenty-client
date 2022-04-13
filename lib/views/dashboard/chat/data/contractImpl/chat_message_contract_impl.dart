

import 'package:client/views/dashboard/chat/data/model/mesage_response/mesage_response.dart';
import 'package:client/views/dashboard/chat/data/sourceImpl/chat_message_source_impl.dart';
import 'package:client/views/dashboard/chat/domain/contract/chat-message_contract.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';

class ChatMessageContractImpl implements ChatMessageContract {
  final ChatMessageSourcesImpl _impl;

  ChatMessageContractImpl(this._impl);

  @override
  Future<Either<Failure, MesageResponse>> chatMessageList(entity) async {
    try {
      final _response = await _impl.chatMessageList(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));}
  }

  @override
  Future<Either<Failure, MesageResponse>> chatMessageSend(entity) async{
    try {
      final _response = await _impl.chatMeesageSend(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));}
  }
}