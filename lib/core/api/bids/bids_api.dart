import 'package:client/core/network/network_service.dart';
import 'package:client/core/network/url_config.dart';
import 'package:client/views/onboarding/domain/entity/bids/accept_or_decline.dart';

class BidsApi {
  final NetworkService _networkService;

  BidsApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<dynamic> listBid() async {
    try {
      await _networkService.call(UrlConfig.listBid, RequestMethod.get);
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> acceptOrDeclineBid(AcceptOrDeclineBidEntity entity) async {
    try {
      await _networkService.call(
          UrlConfig.acceptOrDeclineBid, RequestMethod.post,
          data: entity.toMap());
      return;
    } catch (e) {
      rethrow;
    }
  }
}
