import '../../../../../core/database/session_manager.dart';
import '../../../../../core/entity/user/user.dart';
import '../../../../../core/viewmodels/base_model.dart';
import '../../../../onboarding/domain/usecases/profile_usecases.dart';

class ProfileProvider extends BaseModel {
  User? _user;
  User? get user => _user;

  final ProfileUseCases _useCase;

  ProfileProvider(this._useCase);

  void getMyProfile() async {
    _user = await User.fromJson(SessionManager.instance.usersData);
    // firebaseManager.saveUsersInformation(_user);
    notifyListeners();
  }
}
