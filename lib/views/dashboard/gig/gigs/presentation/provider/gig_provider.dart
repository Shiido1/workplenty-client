import 'package:client/core/helper/configs/instances.dart';
import 'package:client/core/viewmodels/base_model.dart';
import 'package:client/views/dashboard/gig/gigs/domain/usecase/gig_category_usecase.dart';
import 'package:client/views/dashboard/gig/gigs/domain/usecase/gig_detail_usecase.dart';
import 'package:client/views/dashboard/gig/gigs/domain/usecase/gig_list_usecase.dart';
import 'package:client/views/dashboard/gig/gigs/domain/usecase/gig_skill_usecase.dart';

class GigProvider extends BaseModel {
  final GigCategoryUseCase _gigCategoryUseCase;
  final GigSkillUseCase _gigSkillUseCase;
  final GigListUseCase _gigListUseCase;
  final GigDetailUseCase _gigDetailUseCase;

  GigProvider(this._gigCategoryUseCase, this._gigSkillUseCase,
      this._gigListUseCase, this._gigDetailUseCase);

  void gigList() async {
    try {
      /// show loading indcator if card local database is empty
      final _response = await _gigListUseCase.gigListUseCase();
      _response!.fold((l) => logger.e(l.errorMessage(l)),
          (r) => logger.i('Save Item To Local DB: ${r.data?.data?.length}'));
    } catch (e) {}
  }

  void gigSkill() async {
    try {
      /// show loading indcator if card local database is empty
      final _response = await _gigSkillUseCase.gigSkillUseCase();
      _response!.fold((l) => logger.e(l.errorMessage(l)),
          (r) => logger.i('Save Item To Local DB: ${r.data?.data?.length}'));
    } catch (e) {}
  }

  void gigCategory() async {
    try {
      /// show loading indcator if card local database is empty
      final _response = await _gigCategoryUseCase.gigCategoryUseCase();
      _response!.fold((l) => logger.e(l.errorMessage(l)),
          (r) => logger.i('Save Item To Local DB: ${r.data?.data?.length}'));
    } catch (e) {}
  }

  void gigDetail() async {
    try {
      /// show loading indcator if card local database is empty
      final _response = await _gigDetailUseCase.gigDetailUseCase();
      _response!.fold((l) => logger.e(l.errorMessage(l)),
          (r) => logger.i('Save Item To Local DB: ${r.data?.data?.length}'));
    } catch (e) {}
  }
}
