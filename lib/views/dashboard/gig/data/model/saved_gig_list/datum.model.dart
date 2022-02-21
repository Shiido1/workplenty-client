import 'package:json_annotation/json_annotation.dart';

import 'industry.model.dart';
import 'skill.model.dart';
import 'user.model.dart';

part 'datum.model.g.dart';

@JsonSerializable()
class Datum {
  int? id;
  User? user;
  Industry? industry;
  String? type;
  String? title;
  String? description;
  @JsonKey(name: 'experience_level')
  int? experienceLevel;
  @JsonKey(name: 'cover_letter_required')
  int? coverLetterRequired;
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
  int? totalBudget;
  @JsonKey(name: 'consultancy_rate')
  dynamic consultancyRate;
  @JsonKey(name: 'project_type')
  String? projectType;
  @JsonKey(name: 'payment_type')
  String? paymentType;
  @JsonKey(name: 'total_milestones')
  dynamic totalMilestones;
  List<Skill>? skills;
  List<dynamic>? attachments;
  @JsonKey(name: 'is_published')
  int? isPublished;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Datum({
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
    this.projectType,
    this.paymentType,
    this.totalMilestones,
    this.skills,
    this.attachments,
    this.isPublished,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
