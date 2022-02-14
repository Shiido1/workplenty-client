import 'package:client/core/helper/helper_handler.dart';
import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/routes/routes.dart';
import 'package:client/core/helper/utils/images.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/widgets/buttons.dart';
import 'package:client/views/widgets/image_loader.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showFloatingActionModal(BuildContext context, String title,
    {Function()? onPress}) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          // padding: EdgeInsets.all(13.w),
          color: Pallets.white,
          child: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 4.w, right: 4.w),
              child: Column(children: [
                SizedBox(height: 23.h),
                TextView(
                  text: title,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Pallets.grey700,
                  textAlign: TextAlign.left,
                ),
                Divider(
                  thickness: 1,
                  color: Pallets.grey,
                ),
                SizedBox(height: 25.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () =>
                              PageRouter.gotoNamed(Routes.freelance, context),
                          child: TextView(
                            text: 'Freelance',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Pallets.grey,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: () => PageRouter.gotoNamed(
                              Routes.home_service, context),
                          child: TextView(
                            text: 'Home Service',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Pallets.grey,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: () =>
                              PageRouter.gotoNamed(Routes.consultancy, context),
                          child: TextView(
                            text: 'Live Consultancy',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Pallets.grey,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
        );
     
      });
}

void showDepositToPersonalModal(BuildContext context, {Function()? onPress}) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: EdgeInsets.fromLTRB(32.w, 68.w, 32.w, 8.w),
          height: Utils.getDeviceHeight(context) / 2,
          color: Pallets.white,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageLoader(
                    path: AppImages.master,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'Master Card Debit (5432)',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      TextView(
                        text: '02 / 2023',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      TextView(
                        text: 'Oluwafemi Allen',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            TextView(
              text: 'Deposit Amount',
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
            SizedBox(
              height: 20.h,
            ),
            Divider(
              thickness: 1,
              color: Pallets.grey,
            ),
            SizedBox(
              height: 50.h,
            ),
            ButtonWidget(
              radius: 15.r,
              buttonText: 'Deposit to Personal Balance',
              onPressed: () {},
            ),
          ]),
        );
      });
}

void showPayoutModal(BuildContext context, String title,
    {Function()? onPress}) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          color: Pallets.white,
          child: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 23.h),
                    Align(
                      alignment: Alignment.center,
                      child: TextView(
                        text: title,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Pallets.grey700,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        TextView(
                          text: 'Service',
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                        Spacer(),
                        TextView(
                          text: 'Home Service',
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: Pallets.grey700,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        TextView(
                          text: 'Date-Time',
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                        Spacer(),
                        TextView(
                          text: '23/12/2021 - 4PM',
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: Pallets.grey700,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        TextView(
                          text: 'Service Time',
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                        Spacer(),
                        TextView(
                          text: 'NGN4,500/hr',
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: Pallets.grey700,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        TextView(
                          text: 'Time Spent',
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                        Spacer(),
                        TextView(
                          text: '4hrs',
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: Pallets.grey700,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        TextView(
                          text: 'Amount',
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                        Spacer(),
                        TextView(
                          text: 'NGN110,000',
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          color: Pallets.grey700,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(height: 25.h),
                    Row(
                      children: [
                        TextView(
                          text: 'Service',
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                        Spacer(),
                        TextView(
                          text: 'Software Installation',
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: Pallets.grey700,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    TextView(
                      text: 'Details',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Pallets.grey,
                    ),
                    SizedBox(height: 15.h),
                    TextView(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui vulputate ut pretium pellentesque at eu, tempor euismod non. Eget ut sed amet, duis gravida. Id vene tristique venenatis diam justo. Nunc blandit cursus ult nunc, dignissim fames. Lobortis sed.',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Pallets.grey,
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: ButtonWidget(
                              buttonStyle: true,
                              buttonText: 'Auto-Payment',
                              onPressed: () =>
                                  showDepositToPersonalModal(context),
                              color: Pallets.primary100,
                              borderColor: Pallets.primary100,
                              radius: 15.r,
                              primary: Pallets.white,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: ButtonWidget(
                              radius: 15.r,
                              buttonText: 'Pay for Service',
                              onPressed: () =>
                                  showDepositToPersonalModal(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ]),
            ),
          ),
        );
      });
}

void showBidModal(BuildContext context, String name, {Function()? onPress}) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          color: Pallets.white,
          child: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 23.h),
                    Align(
                      alignment: Alignment.center,
                      child: TextView(
                        text: name,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Pallets.grey700,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        TextView(
                          text: 'Payment Type',
                          fontWeight: FontWeight.w700,
                          fontSize: 19.sp,
                        ),
                        Spacer(),
                        TextView(
                          text: 'Milestone',
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          color: Pallets.grey700,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(height: 25.h),
                    TextView(
                      text: 'Milestone',
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                    TextView(
                      text: 'Milestone description',
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: Pallets.grey700,
                      textAlign: TextAlign.left,
                    ),
                    TextView(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Pallets.grey700,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        TextView(
                          text: 'Due Date',
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: Pallets.grey700,
                        ),
                        Spacer(),
                        TextView(
                          text: 'Amount (NGN)',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Pallets.grey700,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        TextView(
                          text: '23/12/2021',
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                        Spacer(),
                        TextView(
                          text: '34,000',
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    TextView(
                      text: 'Milestone',
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                    TextView(
                      text: 'Milestone description',
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: Pallets.grey700,
                      textAlign: TextAlign.left,
                    ),
                    TextView(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Pallets.grey700,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    TextView(
                      text: 'Due Date',
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      color: Pallets.grey700,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        TextView(
                          text: '23/12/2021',
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                        Spacer(),
                        TextView(
                          text: '34,000',
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                      ],
                    ),
                    SizedBox(height: 35.h),
                    Row(
                      children: [
                        TextView(
                          text: 'Bid',
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                        Spacer(),
                        TextView(
                          text: 'NGC110,000',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Pallets.grey700,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    TextView(
                      text: 'Details',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Pallets.grey,
                    ),
                    SizedBox(height: 15.h),
                    TextView(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui vulputate ut pretium pellentesque at eu, tempor euismod non. Eget ut sed amet, duis gravida. Id vene tristique venenatis diam justo. Nunc blandit cursus ult nunc, dignissim fames. Lobortis sed.',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Pallets.grey,
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: ButtonWidget(
                              buttonStyle: true,
                              buttonText: 'Message',
                              onPressed: () {},
                              color: Pallets.primary100,
                              borderColor: Pallets.primary100,
                              primary: Pallets.white,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: ButtonWidget(
                              buttonText: 'Pay for Service',
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ]),
            ),
          ),
        );
      });
}
