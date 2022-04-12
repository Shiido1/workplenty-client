class Data {
  double? personalBalance;
  int? pendingSpendings;
  double? monthlySpendings;
  double? avgMonthly;
  double? available;
  double? totalSpendings;
  double? inReview;
  double? activeSpendings;

  Data({
    this.personalBalance,
    this.pendingSpendings,
    this.monthlySpendings,
    this.avgMonthly,
    this.available,
    this.totalSpendings,
    this.inReview,
    this.activeSpendings,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        personalBalance: (json['personal_balance'] as num?)?.toDouble(),
        pendingSpendings: json['pending_spendings'] as int?,
        monthlySpendings: (json['monthly_spendings'] as num?)?.toDouble(),
        avgMonthly: (json['avg_monthly'] as num?)?.toDouble(),
        available: (json['available'] as num?)?.toDouble(),
        totalSpendings: (json['total_spendings'] as num?)?.toDouble(),
        inReview: (json['in_review'] as num?)?.toDouble(),
        activeSpendings: (json['active_spendings'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'personal_balance': personalBalance,
        'pending_spendings': pendingSpendings,
        'monthly_spendings': monthlySpendings,
        'avg_monthly': avgMonthly,
        'available': available,
        'total_spendings': totalSpendings,
        'in_review': inReview,
        'active_spendings': activeSpendings,
      };
}
