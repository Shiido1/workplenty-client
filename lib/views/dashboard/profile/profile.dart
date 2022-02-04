import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/images.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/dashboard/profile/manage/manage.dart';
import 'package:client/views/dashboard/profile/payout/payout_screen.dart';
import 'package:client/views/dashboard/profile/request/requests.dart';
import 'package:client/views/dashboard/profile/statistics/statistics.dart';
import 'package:client/views/dashboard/profile/widget/clicks_one.dart';
import 'package:client/views/dashboard/profile/widget/profile_image.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bids/presentation/bids.dart';
import 'edit_profile.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileImageCardOne(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.h),
                Row(
                  children: [
                    Expanded(
                      child: ClickOne(
                          image: AppImages.edit_profile,
                          text: 'Edit Profile',
                          color: Pallets.primary100,
                          onTap: () =>
                              PageRouter.gotoWidget(EditProfile(), context)),
                    ),
                    SizedBox(width: 44.w),
                    Expanded(
                      child: ClickOne(
                          image: AppImages.share,
                          color: Pallets.primary100,
                          text: 'Share'),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                TextView(
                    text: 'Quick Links',
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left),
                SizedBox(height: 16.h),
                ClickOne(
                    image: AppImages.request,
                    text: 'Post Requests',
                    trailing: true,
                    onTap: () => PageRouter.gotoWidget(Requests(), context)),
                SizedBox(height: 16.h),
                ClickOne(
                    image: AppImages.profile_hire,
                    text: 'Hire',
                    trailing: true,
                    onTap: () => PageRouter.gotoWidget(Hire(), context)),
                SizedBox(height: 16.h),
                ClickOne(
                    image: AppImages.statistics,
                    text: 'Statistics',
                    trailing: true,
                    onTap: () => PageRouter.gotoWidget(Statistics(), context)),
                SizedBox(height: 16.h),
                ClickOne(
                    image: AppImages.payout,
                    text: 'Payout',
                    trailing: true,
                    onTap: () =>
                        PageRouter.gotoWidget(PayoutScreen(), context)),
                SizedBox(height: 16.h),
                ClickOne(
                    image: AppImages.manage,
                    text: 'Manage Account',
                    trailing: true,
                    onTap: () =>
                        PageRouter.gotoWidget(ManageProfile(), context)),
                SizedBox(height: 16.h),
                ClickOne(
                    image: AppImages.logout,
                    text: 'Logout',
                    trailing: true,
                    onTap: () {})
              ],
            ),
          )
        ],
      ),
    );
  }
}
