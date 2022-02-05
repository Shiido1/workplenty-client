import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/entity/attachments/attachment.dart';
import '../../../../../../core/entity/skills/skill.dart';
import '../../../../../../core/entity/user/user.dart';
import 'industry.dart';

part 'data.g.dart';

@JsonSerializable(explicitToJson: true)
class Data {
  int? id;
  User? user;
  Industry? industry;
  String? type;
  String? title;
  String? description;
  @JsonKey(name: 'experience_level')
  String? experienceLevel;
  @JsonKey(name: 'cover_letter_required')
  String? coverLetterRequired;
  @JsonKey(name: 'service_date')
  dynamic serviceDate;
  @JsonKey(name: 'service_time')
  dynamic serviceTime;
  @JsonKey(name: 'service_address')
  dynamic serviceAddress;
  @JsonKey(name: 'service_duration')
  dynamic serviceDuration;
  String? timeline;
  @JsonKey(name: 'hourly_budget')
  dynamic hourlyBudget;
  @JsonKey(name: 'total_budget')
  String? totalBudget;
  @JsonKey(name: 'consultancy_rate')
  dynamic consultancyRate;
  @JsonKey(name: 'payment_type')
  String? paymentType;
  List<Skill>? skills;
  List<Attachment>? attachments;
  @JsonKey(name: 'is_published')
  String? isPublished;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Data({
    this.id,
    this.user,
    this.industry,
    this.type,
    this.title,
    this.description,
    this.experienceLevel,
    this.coverLetterRequired,
    this.serviceDate,
    this.serviceTime,
    this.serviceAddress,
    this.serviceDuration,
    this.timeline,
    this.hourlyBudget,
    this.totalBudget,
    this.consultancyRate,
    this.paymentType,
    this.skills,
    this.attachments,
    this.isPublished,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
