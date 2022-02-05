import 'package:client/core/helper/configs/instances.dart';
import 'package:client/core/viewmodels/base_model.dart';
import 'package:client/views/dashboard/chat/domain/usecase/chat_usecase.dart';

class ChatProvider extends BaseModel {
  final ChatUseCase _useCase;

  ChatProvider(this._useCase);

  void chatList() async {
    try {
      /// show loading indcator if card local database is empty
      final _response = await _useCase.chatListUseCase();
      _response!.fold((l) => logger.e(l.errorMessage(l)),
          (r) => logger.i('Save Item To Local DB: ${r.data?.data?.length}'));
    } catch (e) {}
  }
}
