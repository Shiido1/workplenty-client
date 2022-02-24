import 'package:client/core/helper/configs/instances.dart';
import 'package:client/core/viewmodels/base_model.dart';
import 'package:client/views/dashboard/gig/domain/entity/gig/gig_entity.dart';
import 'package:client/views/dashboard/gig/domain/source/local/gig_dao.dart';
import 'package:client/views/dashboard/gig/domain/source/local/skill_dao.dart';

import '../../../../../core/entity/datum/datum.model.dart';
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
      logger.e('An error occured: $e');
    }
  }

  void getListOfSkills() async {
    try {
      final _response = await _useCase.listOfSkills();
      _response!.fold((l) => logger.e(l.errorMessage(l)),
          (r) => skillDao!.saveSkills(r.data?.data ?? []));
    } catch (e) {
      logger.e('An error occured: $e');
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
      logger.e('An error occured: $e');
    }
  }
}
