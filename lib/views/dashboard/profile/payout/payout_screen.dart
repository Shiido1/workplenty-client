import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/image_decoration.dart';
import 'package:client/views/widgets/modal_bottom.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PayoutScreen extends StatelessWidget {
  const PayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar2(context,
          showClearButton: false,
          leadingWidget: IconButton(
              onPressed: () => PageRouter.goBack(context),
              icon: Icon(
                Icons.arrow_back,
                color: Pallets.white,
              )),
          centerTitle: true,
          textColor: Pallets.white,
          title: 'Payout'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Row(
                  children: [
                    TextView(
                      text: 'Overview',
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                    Spacer(),
                    TextView(
                      text: 'Deposit',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ImageBgCard(Row(
                children: [
                  Expanded(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'Personal Balance',
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w500,
                        color: Pallets.grey,
                        maxLines: 1,
                      ),
                      SizedBox(height: 5.h),
                      TextView(
                        text: 'NGN 241,000',
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w700,
                        color: Pallets.white,
                        maxLines: 1,
                      ),
                      SizedBox(height: 16.h),
                      TextView(
                        text: 'Total Spending',
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w500,
                        color: Pallets.grey,
                        maxLines: 1,
                      ),
                      SizedBox(height: 5.h),
                      TextView(
                        text: 'NGN 67,000',
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w700,
                        color: Pallets.white,
                        maxLines: 1,
                      ),
                      SizedBox(height: 16.h),
                      TextView(
                        text: 'Pending Spending',
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w500,
                        color: Pallets.grey,
                        maxLines: 1,
                      ),
                      SizedBox(height: 5.h),
                      TextView(
                        text: 'NGN 77,000',
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
                        text: 'NGN 93,000',
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
                        text: 'NGN 83,000',
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w700,
                        color: Pallets.white,
                        maxLines: 1,
                      ),
                      SizedBox(height: 16.h),
                      TextView(
                        text: 'Active Payment',
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w500,
                        color: Pallets.grey,
                        maxLines: 1,
                      ),
                      SizedBox(height: 5.h),
                      TextView(
                        text: 'NGN 67,000',
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w700,
                        color: Pallets.white,
                        maxLines: 1,
                      ),
                    ],
                  )),
                ],
              )),
              SizedBox(
                height: 37.h,
              ),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Row(
                  children: [
                    TextView(
                      text: 'Activity',
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        TextView(
                          text: 'Sort:',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        Row(
                          children: [
                            TextView(
                              text: 'All',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Pallets.grey,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Pallets.grey,
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                  ],
                ),
              ),
              ...[1, 2, 3, 4, 5, 5, 6, 7, 78, 8].map((e) => textBody(context)).toList()
            ],
          ),
        ),
      ),
    );
  }

  textBody(BuildContext context) => GestureDetector(
    onTap: ()=>showPayoutModal(context, 'Accept Payment'),
    child: Container(
          margin: EdgeInsets.all(8.w),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Pallets.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: TextView(
            text:
                'NGN 77,000, pending payment from Available Balance to Account Number : 00000****',
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: Pallets.grey,
          ),
        ),
  );
}
