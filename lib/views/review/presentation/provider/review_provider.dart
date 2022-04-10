import 'package:client/core/helper/configs/instances.dart';
import 'package:client/views/review/data/model/review_list_response_model/revie_list_response_model.dart';
import 'package:client/views/review/domain/entity/review_entity.dart';
import 'package:client/views/review/domain/usecase/review_usecase.dart';
import 'package:flutter/material.dart';

import '../../../../core/viewmodels/base_model.dart';

class ReviewProvider extends BaseModel {
  final ReviewUsesCases _useCase;
  RevieListResponseModel? responseModel;

  late BuildContext _context;
  bool _loading = false;

  BuildContext get buildContext => _context;

  bool get loading => _loading;

  /// initialize auth viewmodel
  void init(BuildContext context) {
    this._context = context;
  }

  /// show loading indicator
  void showLoading({bool notify = false}) {
    _loading = true;
    if (notify) notifyListeners();
  }

  /// hide loading indicator
  void hideLoading() {
    _loading = false;
    notifyListeners();
  }

  ReviewProvider(this._useCase);

  void listOfReview(ReviewEntity entity) async {
    try {
      showLoading(notify: false);
      final _response = await _useCase.reviewList(Params(entity: entity));
      _response.fold(
          (l) => logger.e(l.errorMessage(l)), (r) => responseModel = r);
    } catch (e) {
      logger.e('An error occurred: $e');
    }
    hideLoading();
  }
}
