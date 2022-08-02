class Data {
  int? personalBalance;
  int? available;
  int? pendingEarning;
  int? inReview;
  int? pendingWithdrawal;
  int? totalWithdrawal;

  Data({
    this.personalBalance,
    this.available,
    this.pendingEarning,
    this.inReview,
    this.pendingWithdrawal,
    this.totalWithdrawal,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        personalBalance: json['personal_balance'] as int?,
        available: json['available'] as int?,
        pendingEarning: json['pending_earning'] as int?,
        inReview: json['in_review'] as int?,
        pendingWithdrawal: json['pending_withdrawal'] as int?,
        totalWithdrawal: json['total_withdrawal'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'personal_balance': personalBalance,
        'available': available,
        'pending_earning': pendingEarning,
        'in_review': inReview,
        'pending_withdrawal': pendingWithdrawal,
        'total_withdrawal': totalWithdrawal,
      };
}
