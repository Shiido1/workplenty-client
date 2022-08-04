// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:io';
import 'dart:io';
import 'dart:io';

import 'package:async/async.dart';
import 'package:client/core/database/session_manager.dart';
import 'package:client/core/entity/default_response.dart';
import 'package:client/core/enums/export_enums.dart';
import 'package:client/core/helper/configs/instances.dart';
import 'package:client/core/network/url_config.dart';
import 'package:client/views/dashboard/gig/presentation/services/freelance/model/milestone.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

import '../../../../../../core/database/session_manager.dart';
import '../../../../../../core/network/app_config.dart';

class GigEntity extends DefaultResponse {
  final String? id;
  final String? industryId;
  final GigType? type;
  final String? title;
  final String? privateMessage;
  final String? description;
  final String? timeline;
  final PaymentType? paymentType;
  final String? isPublished;
  final String? experienceLevel;
  final String? coverLetterRequired;
  final String? totalBudget;
  final String? hourlyBudget;
  final List<String>? skill;
  final List<MultipartFile>? attachments;
  final List<File>? dummyAttachments;
  final List<int>? invited_artisan_ids;
  final ProjectType? projectType;
  final List<MilestoneModel>? milestones;
  final String? searchKeyWord;
  final String? serviceDate;
  final String? serviceTime;
  final String? serviceAddress;
  final String? serviceDuration;

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
      this.hourlyBudget,
      this.skill,
      this.attachments,
      this.dummyAttachments,
      this.invited_artisan_ids,
      this.projectType,
      this.searchKeyWord,
      this.serviceDate,
      this.serviceAddress,
      this.serviceTime,
      this.serviceDuration,
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
      'payment_type': fromPaymentType(paymentType),
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
      'payment_type': fromPaymentType(paymentType),
      'is_published': isPublished,
      'experience_level': experienceLevel,
      'cover_letter_required': coverLetterRequired,
      'total_budget': totalBudget,
      'skill': skill,
      'attachments': attachments,
      'invited_artisan_ids': invited_artisan_ids,
      'project_type': fromProjectType(projectType),
      'milestones': milestones?.map((e) => e.toMap()).toList()
    };
  }

  Map<String, dynamic> availableListQuery() {
    return {};
  }

  Map<String, dynamic> filterArtisan() => {'search_keywords': searchKeyWord};

  Future<http.MultipartRequest> saveClientsGig() async {
    final uri = Uri.parse('${AppConfig.coreBaseUrl}${UrlConfig.saveGig}');

    http.MultipartRequest request = new http.MultipartRequest('POST', uri);

    request.headers.addAll(
        {"authorization": "Bearer ${SessionManager.instance.authToken}"});

    if (dummyAttachments != null && dummyAttachments!.isNotEmpty) {
      File file = dummyAttachments!.first;

      http.ByteStream stream =
          new http.ByteStream(DelegatingStream.typed(file.openRead()));
      int length = await file.length();

      http.MultipartFile multipartFile = new http.MultipartFile(
          'attachments[]', stream, length,
          filename: basename(file.path));

      request.files.add(multipartFile);
    }

    request.fields["industry_id"] = industryId.toString();
    request.fields["type"] = fromGigType(type) ?? '';
    request.fields["title"] = title ?? '';
    request.fields["description"] = description ?? '';
    if (serviceAddress != null)
      request.fields["service_address"] = serviceAddress ?? '';
    if (serviceDuration != null)
      request.fields["service_duration"] = serviceDuration ?? '';
    if (privateMessage != null)
      request.fields["private_message"] = privateMessage ?? '';
    if (timeline != null) request.fields["timeline"] = timeline ?? '';
    if (projectType != null)
      request.fields["project_type"] = fromProjectType(projectType) ?? '';
    if (paymentType != null)
      request.fields["payment_type"] = fromPaymentType(paymentType) ?? '';
    if (isPublished != null) request.fields["is_published"] = isPublished ?? '';
    if (experienceLevel != null)
      request.fields["experience_level"] = experienceLevel ?? '';
    if (coverLetterRequired != null)
      request.fields["cover_letter_required"] = coverLetterRequired ?? '';
    request.fields["hourly_budget"] = hourlyBudget ?? '';
    if (totalBudget != null) request.fields["total_budget"] = totalBudget ?? '';
    request.fields["service_date"] = serviceDate ?? '';
    request.fields["service_time"] = serviceTime ?? '';
    if (skill != null) {
      for (int i = 0; i < skill!.length; i++)
        request.fields["skills[$i]"] = skill![i];
    }
    if (invited_artisan_ids != null) {
      for (int i = 0; i < invited_artisan_ids!.length; i++)
        request.fields["invited_artisan_ids[$i]"] =
            invited_artisan_ids![i].toString();
    }

    if (this.milestones != null) {
      for (int i = 0; i < milestones!.length; i++) {
        request.fields["milestones[$i][description]"] =
            milestones![i].description ?? '';
        request.fields["milestones[$i][due_date]"] =
            milestones![i].dueDate ?? '';
        request.fields["milestones[$i][amount]"] = milestones![i].amount ?? '';
      }
    }

    return request;
  }

  Map<String, dynamic> saveClientsGig1() {
    return {
      'id': id,
      'industry_id': industryId,
      'type': fromGigType(type),
      'title': title,
      'private_message': privateMessage,
      'description': description,
      'timeline': timeline,
      'payment_type': fromPaymentType(paymentType),
      'is_published': isPublished,
      'experience_level': experienceLevel,
      'cover_letter_required': coverLetterRequired,
      'total_budget': totalBudget,
      'skill[]': skill,
      'attachments[]': attachments,
      'invited_artisan_ids[]': invited_artisan_ids,
      'project_type': fromProjectType(projectType),
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
