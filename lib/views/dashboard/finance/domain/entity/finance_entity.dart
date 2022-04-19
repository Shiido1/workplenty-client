
// ignore_for_file: must_be_immutable

import '../../../../../core/entity/default_response.dart';

class FinanceEntity extends DefaultResponse {
  final String? gateWay;
  final String? paymentRef;

  FinanceEntity({this.gateWay, this.paymentRef});

  @override
  List<Object?> get props => [gateWay!, paymentRef!];

  Map<String, dynamic> toTopup() {
    return {
      'gateway' : '',
      'payment_reference': '1',
    };
  }
}