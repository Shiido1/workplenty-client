import 'dart:convert';

import 'package:http/src/multipart_request.dart';

class MilestoneModel {
  String? description;
  String? dueDate;
  String? amount;

  MilestoneModel({
    this.description,
    this.dueDate,
    this.amount,
  });

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'due_date': dueDate,
      'amount': amount,
    };
  }

  toMap1(MultipartRequest request) {
    request.fields['description'] = description ?? '';
    request.fields['due_date'] = dueDate ?? '';
    request.fields['amount'] = amount ?? '';
    return request;
  }

  factory MilestoneModel.fromMap(Map<String, dynamic> map) {
    return MilestoneModel(
      description: map['description'],
      dueDate: map['dueDate'],
      amount: map['amount'],
    );
  }

  @override
  String toString() =>
      'MilestoneModel(description: $description, dueDate: $dueDate, amount: $amount)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MilestoneModel &&
        other.description == description &&
        other.dueDate == dueDate &&
        other.amount == amount;
  }

  @override
  int get hashCode => description.hashCode ^ dueDate.hashCode ^ amount.hashCode;
}
