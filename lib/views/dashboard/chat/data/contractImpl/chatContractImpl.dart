import 'package:client/views/dashboard/chat/data/model/chat_list_response/chat_list_response.dart';
import 'package:client/core/error/failures.dart';
import 'package:client/views/dashboard/chat/data/model/mesage_response/mesage_response.dart';
import 'package:client/views/dashboard/chat/data/sourceImpl/chatSourceImpl.dart';
import 'package:client/views/dashboard/chat/domain/contract/chat_contract.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entity/chat_entity.dart';

class ChatContractImpl implements ChatContract {
  final ChatSourcesImpl _impl;

  ChatContractImpl(this._impl);

  @override
  Future<Either<Failure, ChatListResponse>> chatList() async {
    try {
      final _response = await _impl.chatList();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MesageResponse>> chatMessageList(entity) async {
    try {
      final _response = await _impl.chatMessageList(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MesageResponse>> chatMessageSend(entity) async {
    try {
      final _response = await _impl.chatMeesageSend(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> chatInitiate(ChatEntity entity) async {
    try {
      final _response = await _impl.chatInitiate(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
