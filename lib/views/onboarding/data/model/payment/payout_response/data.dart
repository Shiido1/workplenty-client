class Data {
  int? id;
  String? bankName;
  String? accountName;
  String? accountNumber;

  Data({this.id, this.bankName, this.accountName, this.accountNumber});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        bankName: json['bank_name'] as String?,
        accountName: json['account_name'] as String?,
        accountNumber: json['account_number'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'bank_name': bankName,
        'account_name': accountName,
        'account_number': accountNumber,
      };
}
