import 'package:client/core/entity/default_response.dart';

// ignore: must_be_immutable
class CardEntity extends DefaultResponse {
  final String? name;
  final String? number;
  final String? expMonth;
  final String? expYear;
  final String? cvv;
  final String? id;

  CardEntity(
      {this.id, this.name, this.number, this.expMonth, this.expYear, this.cvv});
  @override
  List<Object?> get props => [];

  Map<String, dynamic> toSave() {
    return {
      'number': number,
      'name': name,
      'expiry_month': expMonth,
      'expiry_year': expYear,
      'cvv': cvv,
    };
  }

  Map<String, dynamic> toRemove() {
    return {
      'id': id,
    };
  }
}
