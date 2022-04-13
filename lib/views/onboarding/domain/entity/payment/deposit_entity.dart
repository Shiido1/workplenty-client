// ignore_for_file: must_be_immutable

import 'package:client/core/entity/default_response.dart';

class DepositEntity extends DefaultResponse {
  final String? cardId;
  final String? amount;

  DepositEntity({this.cardId, this.amount});

  @override
  List<Object?> get props => [cardId!, amount!];

  Map<String, dynamic> toDeposit() {
    return {
      'card_id': '2',
      'amount': '1000',
    };
  }
}
