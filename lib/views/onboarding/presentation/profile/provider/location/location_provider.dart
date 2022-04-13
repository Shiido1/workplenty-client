import 'package:client/core/enums/viewstate.dart';
import 'package:client/core/helper/configs/instances.dart';
import 'package:client/core/viewmodels/base_model.dart';
import 'package:client/views/onboarding/domain/usecases/profile_usecases.dart';

import '../../../../data/model/location_response/datum.dart';

class LocationProvider extends BaseModel {
  final ProfileUseCases? _useCases;

  LocationProvider(this._useCases);

  List<Datum>? countries = [];

  Datum? _datum;

  /// SET State
  void setStateValue(Datum d) {
    _datum = d;
    notifyListeners();
  }

  /// FETCH countries
  void fetchCountries() async {
    try {
      setState(ViewState.busy);
      final _response = await _useCases?.countries();
      _response!.fold((l) => null, (r) {
        countries = r.data ?? [];
        setState(ViewState.idle, triggerListener: true);
      });
    } catch (e) {
      logger.e(e);
      setState(ViewState.idle, triggerListener: true);
    }
  }

  /// FETCH states
  void fetchStates() async {
    if (_datum == null) return;
    try {
      setState(ViewState.busy);
      final _response = await _useCases?.states(Params(entity: _datum?.id));
      _response!.fold((l) => null, (r) {
        countries = r.data ?? [];
        setState(ViewState.idle, triggerListener: true);
      });
    } catch (e) {
      logger.e(e);
      setState(ViewState.idle, triggerListener: true);
    }
  }
}
