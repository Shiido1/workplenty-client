import 'package:client/core/error/failures.dart';
import 'package:client/views/dashboard/chat/data/model/chat_list_response/chat_list_response.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/mesage_response/mesage_response.dart';
import '../entity/chat_entity.dart';

abstract class ChatContract {
  Future<Either<Failure, ChatListResponse>> chatList();
  Future<Either<Failure, MesageResponse>> chatMessageList(ChatEntity entity);
  Future<Either<Failure, MesageResponse>> chatMessageSend(ChatEntity entity);
  Future<Either<Failure, dynamic>> chatInitiate(ChatEntity entity);
}
