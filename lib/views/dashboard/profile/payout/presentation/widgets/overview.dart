import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/helper/helper_handler.dart';
import '../../../../../../../core/helper/utils/pallets.dart';
import '../../../../../widgets/image_decoration.dart';
import '../../../../../widgets/review_bg_card.dart';
import '../../../../../widgets/text_views.dart';
import '../stateManager/provider/payout_provider.dart';

class GetOverviewWidget extends StatelessWidget {
  const GetOverviewWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Provider.of<PayoutProvider>(context, listen: false).overview();
    Provider.of<PayoutProvider>(context, listen: false).transactions();
    return Consumer<PayoutProvider>(
      builder: (context, provider, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageBgCard(Row(
              children: [
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'Pending Balance',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w500,
                      color: Pallets.grey,
                      maxLines: 1,
                    ),
                    SizedBox(height: 5.h),
                    TextView(
                      text: Utils.currency(
                          provider.overviewData?.pendingSpendings ?? 0),
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w700,
                      color: Pallets.white,
                      maxLines: 1,
                    ),
                    SizedBox(height: 16.h),
                    TextView(
                      text: 'Pending Earning',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w500,
                      color: Pallets.grey,
                      maxLines: 1,
                    ),
                    SizedBox(height: 5.h),
                    TextView(
                      text: Utils.currency(
                          provider.overviewData?.personalBalance ?? 0),
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w700,
                      color: Pallets.white,
                      maxLines: 1,
                    ),
                    SizedBox(height: 16.h),
                    TextView(
                      text: 'Pending Withdrawal',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w500,
                      color: Pallets.grey,
                      maxLines: 1,
                    ),
                    SizedBox(height: 5.h),
                    TextView(
                      text: Utils.currency(0),
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w700,
                      color: Pallets.white,
                      maxLines: 1,
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextView(
                      text: 'Available',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w500,
                      color: Pallets.grey,
                      maxLines: 1,
                    ),
                    SizedBox(height: 5.h),
                    TextView(
                      text: Utils.currency(
                          provider.overviewData?.available ?? 0),
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w700,
                      color: Pallets.white,
                      maxLines: 1,
                    ),
                    SizedBox(height: 16.h),
                    TextView(
                      text: 'In Review',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w500,
                      color: Pallets.grey,
                      maxLines: 1,
                    ),
                    SizedBox(height: 5.h),
                    TextView(
                      text: Utils.currency(
                          provider.overviewData?.inReview ?? 0),
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w700,
                      color: Pallets.white,
                      maxLines: 1,
                    ),
                    SizedBox(height: 16.h),
                    TextView(
                      text: 'Withdraw',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w500,
                      color: Pallets.grey,
                      maxLines: 1,
                    ),
                    SizedBox(height: 5.h),
                    TextView(
                      text: Utils.currency(0),
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w700,
                      color: Pallets.white,
                      maxLines: 1,
                    ),
                  ],
                )),
              ],
            )),
            SizedBox(height: 37.h),
            Row(
              children: [
                Expanded(
                    child: TextView(
                  text: 'Activity',
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  maxLines: 1,
                )),
                Row(
                  children: [
                    TextView(
                      text: 'Sort: ',
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      maxLines: 1,
                    ),
                    TextView(
                        text: 'All',
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w500,
                        maxLines: 1,
                        color: Pallets.mildGrey200),
                    Icon(Icons.keyboard_arrow_down, color: Pallets.grey)
                  ],
                )
              ],
            ),
            SizedBox(height: 12.h),
            
            ...[1, 1, 1, 1]
                .map(
                  (transaction) => Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    child: ReviewBgCard(TextView(
                      text: '${Utils.currency(0)}, ${''}',
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      fontWeight: FontWeight.w400,
                      color: Pallets.grey,
                      fontSize: 16,
                    )),
                  ),
                )
                .toList()
          ],
        );
      },
    );
  }
}
