import 'package:client/core/entity/default_response.dart';

// ignore: must_be_immutable
class CardEntity extends DefaultResponse {
  final String? id;
  final String? name;
  final String? firstDigit;
  final String? lastDigit;
  final String? expMonth;
  final String? expYear;
  final String? number;
  final String? cvv;

  CardEntity(
      {this.name,
      this.id,
      this.firstDigit,
      this.lastDigit,
      this.expMonth,
      this.expYear,
      this.number,
      this.cvv});

  @override
  List<Object?> get props => [];

  Map<String, dynamic> save() {
    return {
      "name": name,
      "first_digits": firstDigit,
      "last_digits": lastDigit,
      "expiry_month": expMonth,
      "expiry_year": expYear,
      "number": number,
      "cvv": cvv,
    };
  }

  Map<String, dynamic> remove() {
    return {
      "id": id,
    };
  }
}
