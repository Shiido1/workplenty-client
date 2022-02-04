import 'package:client/core/api/bids/bids_api.dart';
import 'package:client/views/dashboard/profile/bids/data/model/accept_or_decline_bid_response/accept_or_decline_bid_response.dart';
import 'package:client/views/dashboard/profile/bids/data/model/list_bid_response/list_bid_response.dart';

import 'package:client/views/onboarding/domain/entity/bids/accept_or_decline.dart';
import 'package:client/views/dashboard/profile/bids/domain/source/bids_source.dart';

class BidsSourceImpl implements BidsSource {
  final BidsApi _api;

  BidsSourceImpl({required BidsApi api}) : _api = api;

  @override
  Future<AcceptOrDeclineBidResponse> acceptOrDeclineBid(
      AcceptOrDeclineBidEntity entity) async {
    return await _api.acceptOrDeclineBid(entity);
  }

  @override
  Future<ListBidsResponse> listBid() async {
    return await _api.listBid();
  }
}
