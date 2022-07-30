import 'package:equatable/equatable.dart';

class PayoutEntity extends Equatable {
  final String? country;
  final String? bankName;
  final String? accountName;
  final String? accountNumber;

  PayoutEntity(
      {this.country, this.bankName, this.accountName, this.accountNumber});

  @override
  List<Object> get props => [country!, bankName!, accountName!, accountNumber!];

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'bank_name': bankName,
      'account_name': accountName,
      'account_number': accountNumber,
    };
  }

  @override
  String toString() =>
      'PayoutEntity(country: $country, bank_name: $bankName, account_name: $accountName,account_number: $accountNumber)';
}
