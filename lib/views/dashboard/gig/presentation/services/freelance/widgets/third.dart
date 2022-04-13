import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/helper/utils/images.dart';
import '../../../../../../widgets/review_bg_card.dart';
import '../../../widget/row_container_widget.dart';
import '../model/milestone.dart';
import 'mile_stone_widget.dart';

class Third extends StatefulWidget {
  const Third({
    Key? key,
    required int paymentTypeIndex,
    required this.list,
  })  : _paymentTypeIndex = paymentTypeIndex,
        super(key: key);

  final int _paymentTypeIndex;
  final Function(List<MilestoneModel>, bool? notify) list;

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  List<MilestoneModel> _milestoneList = [MilestoneModel()];

  @override
  void initState() {
    widget.list(_milestoneList, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget._paymentTypeIndex == 0,
      child: ReviewBgCard(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 23.h),
            RowContainer(image: AppImages.milestone, text: 'Milestone'),
            ..._milestoneList
                .map((mileStone) => MilestoneWidget(
                      mileStone,
                      remove: () => _removeWidget(mileStone),
                      onDescription: (v) => mileStone..description = v,
                      onAmount: (v) => mileStone..amount = v,
                      onDueDate: (v) => setState(() => mileStone..dueDate = v),
                    ))
                .toList(),
            SizedBox(height: 16.h),
            TextView(
              text: 'Add Milestone +',
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.left,
              color: Pallets.primary100,
              onTap: () => _addMoreWidget(),
            )
          ],
        ),
      ),
    );
  }

  void _addMoreWidget() {
    _milestoneList.add(MilestoneModel());
    setState(() {});
    widget.list(_milestoneList, true);
  }

  void _removeWidget(MilestoneModel m) {
    if (_milestoneList.length != 1) {
      _milestoneList.remove(m);
    }
    setState(() {});
    widget.list(_milestoneList, true);
  }
}
