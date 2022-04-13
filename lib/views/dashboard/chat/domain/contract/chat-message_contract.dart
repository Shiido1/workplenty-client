

import 'package:client/views/dashboard/chat/data/model/mesage_response/mesage_response.dart';
import 'package:client/views/dashboard/chat/domain/entity/chat_message_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';

abstract class ChatMessageContract {
  Future<Either<Failure, MesageResponse>> chatMessageList(MessageEntity entity);
  Future<Either<Failure, MesageResponse>> chatMessageSend(MessageEntity entity);
}