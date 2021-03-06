// ignore_for_file: must_be_immutable

import 'package:client/core/entity/default_response.dart';
import 'package:client/views/dashboard/gig/presentation/services/freelance/model/milestone.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/enums/gig_type.dart';

class GigEntity extends DefaultResponse {
  final String? id;
  final String? industryId;
  final GigType? type;
  final String? title;
  final String? privateMessage;
  final String? description;
  final String? timeline;
  final String? paymentType;
  final String? isPublished;
  final String? experienceLevel;
  final String? coverLetterRequired;
  final String? totalBudget;
  final List<String>? skill;
  final List<MultipartFile>? attachments;
  final List<int>? invited_artisan_ids;
  final String? projectType;
  final List<MilestoneModel>? milestones;

  GigEntity(
      {this.privateMessage,
      this.id,
      this.industryId,
      this.type,
      this.title,
      this.description,
      this.timeline,
      this.paymentType,
      this.isPublished,
      this.experienceLevel,
      this.coverLetterRequired,
      this.totalBudget,
      this.skill,
      this.attachments,
      this.invited_artisan_ids,
      this.projectType,
      this.milestones});

  @override
  List<Object?> get props => [];

  Map<String, dynamic> save() {
    return {
      'id': id,
      'industry_id': industryId,
      'private_message': privateMessage,
      'type': type,
      'title': title,
      'description': description,
      'timeline': timeline,
      'payment_type': paymentType,
      'is_published': isPublished,
      'experience_level': experienceLevel,
      'cover_letter_required': coverLetterRequired,
      'total_budget': totalBudget,
      'skill': skill,
      'attachments': attachments,
      'invited_artisan_ids': [2]
    };
  }

  Map<String, dynamic> saveGig() {
    return {
      'id': id,
      'industry_id': industryId,
      'type': fromGigType(type),
      'title': title,
      'private_message': privateMessage,
      'description': description,
      'timeline': timeline,
      'payment_type': paymentType,
      'is_published': isPublished,
      'experience_level': experienceLevel,
      'cover_letter_required': coverLetterRequired,
      'total_budget': totalBudget,
      'skill': skill,
      'attachments': attachments,
      'invited_artisan_ids': invited_artisan_ids,
      'project_type': projectType,
      'milestones': milestones?.map((e) => e.toMap()).toList()
    };
  }

  Map<String, dynamic> availableListQuery() {
    return {};
  }

  Map<String, dynamic> saveClientsGig() {
    return {
      'id': id,
      'industry_id': industryId,
      'type': fromGigType(type),
      'title': title,
      'private_message': privateMessage,
      'description': description,
      'timeline': timeline,
      'payment_type': paymentType,
      'is_published': isPublished,
      'experience_level': experienceLevel,
      'cover_letter_required': coverLetterRequired,
      'total_budget': totalBudget,
      'skill': skill,
      'attachments[]': attachments,
      'invited_artisan_ids[]': invited_artisan_ids,
      'project_type': projectType,
      if (this.milestones != null)
        "milestones[]": this.milestones?.map((e) => e.toMap()).toList()
    };
  }

  Map<String, dynamic> removeAttachment() {
    return {'id': id};
  }

  Map<String, dynamic> savedGigsSave() {
    return {'id': id};
  }

  Map<String, dynamic> getDetailsOfGig() {
    return {'id': id};
  }
}
