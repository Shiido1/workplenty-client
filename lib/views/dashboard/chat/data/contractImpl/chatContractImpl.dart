import 'package:client/views/dashboard/chat/data/model/chat_list_response/chat_list_response.dart';
import 'package:client/core/error/failures.dart';
import 'package:client/views/dashboard/chat/data/sourceImpl/chatSourceImpl.dart';
import 'package:client/views/dashboard/chat/domain/contract/chat_contract.dart';
import 'package:dartz/dartz.dart';

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
}
