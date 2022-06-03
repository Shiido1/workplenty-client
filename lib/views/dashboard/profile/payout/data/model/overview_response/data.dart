import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable(explicitToJson: true)
class Data {
  @JsonKey(name: 'personal_balance')
  double? personalBalance;
  @JsonKey(name: 'pending_spendings')
  int? pendingSpendings;
  @JsonKey(name: 'monthly_spendings')
  double? monthlySpendings;
  @JsonKey(name: 'avg_monthly')
  double? avgMonthly;
  double? available;
  @JsonKey(name: 'total_spendings')
  double? totalSpendings;
  @JsonKey(name: 'in_review')
  double? inReview;
  @JsonKey(name: 'active_spendings')
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

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
