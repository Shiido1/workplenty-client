import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/helper/utils/images.dart';
import '../../../../../../widgets/edit_form_widget.dart';
import '../../../../../../widgets/review_bg_card.dart';
import '../../../widget/row_container_widget.dart';

class Third extends StatelessWidget {
  const Third({
    Key? key,
    required int paymentTypeIndex,
  })  : _paymentTypeIndex = paymentTypeIndex,
        super(key: key);

  final int _paymentTypeIndex;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _paymentTypeIndex == 0,
      child: ReviewBgCard(
        Column(
          children: [
            SizedBox(height: 23.h),
            RowContainer(image: AppImages.milestone, text: 'Milestone'),
            SizedBox(height: 10.h),
            EditFormField(label: 'Milestone description'),
            SizedBox(height: 15.h),
            Row(
              children: [
                Expanded(
                  child: EditFormField(label: 'Due Date'),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: EditFormField(label: 'Amount (NGN)'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
