import 'package:client/core/helper/configs/instances.dart';
import 'package:client/core/viewmodels/base_model.dart';
import 'package:client/views/dashboard/gig/domain/source/local/list_of_artisans_dao.dart';
import 'package:client/views/dashboard/gig/domain/usecase/artisan_usecase.dart';

import '../../../../../core/entity/user/user.dart';

class ArtisanProvider extends BaseModel {
  final ArtisanUseCase _useCase;

  User? _artisan;
  User? get artisan => _artisan;

  ArtisanProvider(this._useCase);

  void listOfArtisan() async {
    try {
      final _response = await _useCase.listOfArtisan();
      _response!.fold((l) => logger.e(l.errorMessage(l)),
          (r) => listOfArtisansDao!.saveListOfArtisans(r.data?.data ?? []));
    } catch (e) {
      logger.e('An error occured: $e');
    }
  }

  /// sets artisans data
  void setArtisan(User? user) {
    _artisan = user;
    notifyListeners();
  }
}
