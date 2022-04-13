import 'package:client/core/error/failures.dart';
import 'package:client/views/dashboard/chat/data/model/chat_list_response/chat_list_response.dart';
import 'package:dartz/dartz.dart';


abstract class ChatContract {
  Future<Either<Failure, ChatListResponse>> chatList();}
