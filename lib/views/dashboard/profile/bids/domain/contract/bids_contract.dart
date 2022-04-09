import 'package:client/core/error/failures.dart';
import 'package:client/views/dashboard/profile/bids/data/model/accept_or_decline_bid_response/accept_or_decline_bid_response.dart';
import 'package:client/views/dashboard/profile/bids/data/model/list_bid_response/list_bid_response.dart';
import 'package:client/views/onboarding/domain/entity/bids/accept_or_decline.dart';
import 'package:dartz/dartz.dart';

abstract class BidsContract {
  Future<Either<Failure, ListBidsResponse>> listBid();
  Future<Either<Failure, AcceptOrDeclineBidResponse>> acceptOrDeclineBid(
      AcceptOrDeclineBidEntity entity);
}
