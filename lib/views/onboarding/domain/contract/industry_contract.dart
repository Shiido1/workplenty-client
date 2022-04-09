import 'package:client/core/error/failures.dart';
import 'package:client/views/onboarding/data/model/industry/delete_industry_response/delete_industry_response.dart';
import 'package:client/views/onboarding/data/model/industry/fetch_industry_response/fetch_industry_response.dart';
import 'package:client/views/onboarding/data/model/industry/list_industry_response/list_industr_response.dart';
import 'package:client/views/onboarding/data/model/industry/save_industry_response/save_industry_response.dart';
import 'package:client/views/onboarding/domain/entity/industry/industry_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IndustryContract {
  Future<Either<Failure, SaveIndustryResponse>> saveIndustry(
      IndustryEntity entity);
  Future<Either<Failure, ListIndustryResponse>> listIndustry();
  Future<Either<Failure, DeleteIndustryResponse>> deleteIndustry(
      IndustryEntity entity);
  Future<Either<Failure, FetchIndustryResponse>> fetchIndustry(
      IndustryEntity entity);
}
