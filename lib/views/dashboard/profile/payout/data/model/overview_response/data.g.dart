// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      personalBalance: (json['personal_balance'] as num?)?.toDouble(),
      pendingSpendings: json['pending_spendings'] as int?,
      monthlySpendings: (json['monthly_spendings'] as num?)?.toDouble(),
      avgMonthly: (json['avg_monthly'] as num?)?.toDouble(),
      available: (json['available'] as num?)?.toDouble(),
      totalSpendings: (json['total_spendings'] as num?)?.toDouble(),
      inReview: (json['in_review'] as num?)?.toDouble(),
      activeSpendings: (json['active_spendings'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'personal_balance': instance.personalBalance,
      'pending_spendings': instance.pendingSpendings,
      'monthly_spendings': instance.monthlySpendings,
      'avg_monthly': instance.avgMonthly,
      'available': instance.available,
      'total_spendings': instance.totalSpendings,
      'in_review': instance.inReview,
      'active_spendings': instance.activeSpendings,
    };
