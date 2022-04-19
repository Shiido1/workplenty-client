class Data {
  int? id;
  int? currentBalance;
  int? lockedBalance;
  int? totalEarnings;
  int? totalSpendings;

  Data({
    this.id,
    this.currentBalance,
    this.lockedBalance,
    this.totalEarnings,
    this.totalSpendings,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        currentBalance: json['current_balance'] as int?,
        lockedBalance: json['locked_balance'] as int?,
        totalEarnings: json['total_earnings'] as int?,
        totalSpendings: json['total_spendings'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'current_balance': currentBalance,
        'locked_balance': lockedBalance,
        'total_earnings': totalEarnings,
        'total_spendings': totalSpendings,
      };
}
