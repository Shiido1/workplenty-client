// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      industry: json['industry'] == null
          ? null
          : Industry.fromJson(json['industry'] as Map<String, dynamic>),
      type: json['type'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      experienceLevel: json['experience_level'] as int?,
      coverLetterRequired: json['cover_letter_required'] as int?,
      serviceDate: json['service_date'],
      serviceTime: json['service_time'],
      serviceAddress: json['service_address'],
      serviceDuration: json['service_duration'],
      timeline: json['timeline'] as String?,
      hourlyBudget: json['hourly_budget'],
      totalBudget: json['total_budget'] as int?,
      consultancyRate: json['consultancy_rate'],
      projectType: json['project_type'] as String?,
      paymentType: json['payment_type'] as String?,
      totalMilestones: json['total_milestones'],
      skills: (json['skills'] as List<dynamic>?)
          ?.map((e) => Skill.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachments: json['attachments'] as List<dynamic>?,
      isPublished: json['is_published'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'industry': instance.industry,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'experience_level': instance.experienceLevel,
      'cover_letter_required': instance.coverLetterRequired,
      'service_date': instance.serviceDate,
      'service_time': instance.serviceTime,
      'service_address': instance.serviceAddress,
      'service_duration': instance.serviceDuration,
      'timeline': instance.timeline,
      'hourly_budget': instance.hourlyBudget,
      'total_budget': instance.totalBudget,
      'consultancy_rate': instance.consultancyRate,
      'project_type': instance.projectType,
      'payment_type': instance.paymentType,
      'total_milestones': instance.totalMilestones,
      'skills': instance.skills,
      'attachments': instance.attachments,
      'is_published': instance.isPublished,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
