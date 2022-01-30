import 'package:client/views/onboarding/data/model/bid/accept_or_decline_bid_response/accept_or_decline_bid_response.dart';
import 'package:client/views/onboarding/data/model/bid/list_bid_response/list_bid_response.dart';
import 'package:client/views/onboarding/domain/entity/bids/accept_or_decline.dart';

abstract class BidsSource {
  Future<ListBidsResponse> listBid();
  Future<AcceptOrDeclineBidResponse> acceptOrDeclineBid(
      AcceptOrDeclineBidEntity entity);
}
