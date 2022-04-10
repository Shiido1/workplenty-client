import 'package:client/core/enums/viewstate.dart';
import 'package:client/core/helper/configs/instances.dart';
import 'package:client/core/viewmodels/base_model.dart';
import 'package:client/views/dashboard/gig/domain/entity/gig/gig_entity.dart';
import 'package:client/views/dashboard/gig/domain/source/local/gig_dao.dart';
import 'package:client/views/dashboard/gig/domain/source/local/skill_dao.dart';

import '../../../../../core/entity/datum/datum.model.dart';
import '../../domain/source/local/gig_category.dart';
import '../../domain/usecase/gig_usecase.dart';

class GigProvider extends BaseModel {
  final GigUseCases _useCase;

  GigProvider(this._useCase);

  List<Datum>? generalListOfDatum = [];

  void getListOfAvailableGigs({GigEntity? entity}) async {
    try {
      final _response =
          await _useCase.getListOfAvailableGigs(Params(entity: entity));
      _response!.fold((l) => logger.e(l.errorMessage(l)),
          (r) => availableGigsDao!.saveAvailableGigs(r.data?.data));
    } catch (e) {
      logger.e('An error occurred: $e');
    }
  }

  void getListOfSkills() async {
    try {
      final _response = await _useCase.listOfSkills();
      _response!.fold((l) => logger.e(l.errorMessage(l)),
          (r) => skillDao!.saveSkills(r.data?.data ?? []));
    } catch (e) {
      logger.e('An error occurred: $e');
    }
  }

  void generalIndustryList() async {
    try {
      final _response = await _useCase.generalIndustryList();
      _response!.fold((l) => logger.e(l.errorMessage(l)), (r) {
        generalListOfDatum = r.data ?? [];
        notifyListeners();
      });
    } catch (e) {
      logger.e('An error occurred: $e');
    }
  }

  void jobCategory() async {
    try {
      if (categoryDao!.box!.isEmpty)
        setState(ViewState.busy, triggerListener: false);
      final _response = await _useCase.categoriesOfGig();
      _response!.fold((l) => logger.e(l.errorMessage(l)), (r) {
        categoryDao!.saveGigCategory(r.data?.data ?? []);
      });
    } catch (e) {
      logger.e('An error occurred: $e');
    }
    setState(ViewState.idle, triggerListener: true);
  }
}
