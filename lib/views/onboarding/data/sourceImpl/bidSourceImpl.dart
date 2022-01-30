import 'package:client/core/api/bids/bids_api.dart';
import 'package:client/views/onboarding/data/model/bid/accept_or_decline_bid_response/accept_or_decline_bid_response.dart';
import 'package:client/views/onboarding/data/model/bid/list_bid_response/list_bid_response.dart';
import 'package:client/views/onboarding/domain/entity/bids/accept_or_decline.dart';
import 'package:client/views/onboarding/domain/source/bids_source.dart';

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
