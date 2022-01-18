import 'package:client/core/database/session_manager.dart';
import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/routes/routes.dart';
import 'package:client/core/helper/utils/images.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/dashboard/profile/hire/bids.dart';
import 'package:client/views/dashboard/profile/manage/manage.dart';
import 'package:client/views/dashboard/profile/payout/payout_screen.dart';
import 'package:client/views/dashboard/profile/request/requests.dart';
import 'package:client/views/dashboard/profile/statistics/statistics.dart';
import 'package:client/views/dashboard/profile/widget/clicks_one.dart';
import 'package:client/views/dashboard/profile/widget/profile_image.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'edit_profile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                          onTap: () =>
                              PageRouter.gotoWidget(EditProfile(), context)),
                    ),
                    SizedBox(width: 44.w),
                    Expanded(
                      child: ClickOne(image: AppImages.share, text: 'Share'),
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
                    onTap: () => _logOut())
              ],
            ),
          )
        ],
      ),
    );
  }

   Future<void> _logOut() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const TextView(
            text: 'Log out?',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            textAlign: TextAlign.left,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.r))),
          content: const TextView(
            text: 'You’ll have to enter your email to access',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            textAlign: TextAlign.left,
          ),
          actions: <Widget>[
            TextView(
              text: 'Cancel',
              fontWeight: FontWeight.w500,
              fontSize: 13,
              textAlign: TextAlign.left,
              onTap: () => PageRouter.goBack(context),
            ),
            SizedBox(width: 20.w),
            InkWell(
              onTap: () async {
                await SessionManager.instance.logOut();
                PageRouter.gotoNamed(Routes.login, context, clearStack: true);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 9.h),
                decoration: BoxDecoration(
                  color: Pallets.primary100,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: TextView(
                  text: 'Log out',
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  textAlign: TextAlign.center,
                  color: Pallets.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
