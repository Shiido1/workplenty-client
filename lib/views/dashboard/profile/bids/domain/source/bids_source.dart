import 'package:client/views/dashboard/profile/bids/data/model/accept_or_decline_bid_response/accept_or_decline_bid_response.dart';
import 'package:client/views/dashboard/profile/bids/data/model/list_bid_response/list_bid_response.dart';
import 'package:client/views/onboarding/domain/entity/bids/accept_or_decline.dart';

abstract class BidsSource {
  Future<ListBidsResponse> listBid();
  Future<AcceptOrDeclineBidResponse> acceptOrDeclineBid(
      AcceptOrDeclineBidEntity entity);
}
