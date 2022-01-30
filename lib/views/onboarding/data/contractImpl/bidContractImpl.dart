import 'package:client/core/error/failures.dart';
import 'package:client/views/onboarding/data/model/bid/accept_or_decline_bid_response/accept_or_decline_bid_response.dart';
import 'package:client/views/onboarding/data/model/bid/list_bid_response/list_bid_response.dart';
import 'package:client/views/onboarding/data/sourceImpl/bidSourceImpl.dart';
import 'package:client/views/onboarding/domain/contract/bids_contract.dart';
import 'package:dartz/dartz.dart';

class BidsContractImpl implements BidsContract {
  final BidsSourceImpl _impl;

  BidsContractImpl(this._impl);

  @override
  Future<Either<Failure, AcceptOrDeclineBidResponse>> acceptOrDeclineBid(
      entity) async {
    try {
      final _response = await _impl.acceptOrDeclineBid(entity);
      return Right(_response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ListBidsResponse>> listBid() async {
    try {
      final _response = await _impl.listBid();
      return Right(_response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
