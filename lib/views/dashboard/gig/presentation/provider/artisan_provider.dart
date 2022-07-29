import 'package:client/core/enums/viewstate.dart';
import 'package:client/core/helper/configs/instances.dart';
import 'package:client/core/viewmodels/base_model.dart';
import 'package:client/views/dashboard/gig/domain/source/local/list_of_artisans_dao.dart';
import 'package:client/views/dashboard/gig/domain/usecase/artisan_usecase.dart';

import 'package:client/core/entity/datum/datum.model.dart';

import '../../domain/entity/gig/gig_entity.dart';

class ArtisanProvider extends BaseModel {
  final ArtisanUseCase _useCase;

  Datum? _datum;
  Datum? get datum => _datum;

  ArtisanProvider(this._useCase);

  Future<void> listOfArtisan({GigEntity? entity}) async {
    try {
      if (listOfArtisansDao!.box!.isEmpty)
        setState(ViewState.busy, triggerListener: false);
      final _response = await _useCase.listOfArtisan(Params(entity: entity));
      _response!.fold((l) => logger.e(l.errorMessage(l)),
          (r) => listOfArtisansDao!.saveListOfArtisans(r.data?.data ?? []));
    } catch (e) {
      logger.e('An error occurred while fetching artisan: $e');
    }
    setState(ViewState.idle);
  }

  /// sets artisans data
  void setArtisan(Datum? d) {
    _datum = d;
    notifyListeners();
  }
}
