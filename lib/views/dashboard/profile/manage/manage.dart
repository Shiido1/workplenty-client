import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/images.dart';
import 'package:client/views/dashboard/profile/manage/address_settings.dart';
import 'package:client/views/dashboard/profile/widget/clicks_one.dart';
import 'package:client/views/dashboard/profile/widget/profile_image_three.dart';
import 'package:client/views/widgets/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'account_settings.dart';
import 'connected_accounts.dart';
import 'payout_Settings.dart';

class ManageProfile extends StatelessWidget {
  const ManageProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileImageCardThree(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32.h),
                  ClickOne(
                      image: AppImages.manage,
                      text: 'Account Settings',
                      trailing: true,
                      onTap: () =>
                          PageRouter.gotoWidget(AccountSettings(), context)),
                  SizedBox(height: 16.h),
                  ClickOne(
                      image: AppImages.address,
                      text: 'Address Details',
                      trailing: true,
                      onTap: () =>
                          PageRouter.gotoWidget(AddressSettings(), context)),
                  SizedBox(height: 16.h),
                  ClickOne(
                      image: AppImages.payout,
                      text: 'Payout Method',
                      trailing: true,
                      onTap: () =>
                          PageRouter.gotoWidget(PayoutSettings(), context)),
                  SizedBox(height: 16.h),
                  ClickOne(
                      image: AppImages.payout,
                      text: 'Connected Account',
                      trailing: true,
                      onTap: () =>
                          PageRouter.gotoWidget(ConnectedAccounts(), context)),
                  SizedBox(height: 16.h),
                  ClickOne(
                      image: AppImages.moon,
                      text: 'Dark Mode',
                      trailing: false,
                      widget: CustomSwitch(onChanged: (value) {}, value: true)),
                  SizedBox(height: 16.h),
                  ClickOne(
                      image: AppImages.notification,
                      text: 'Notification Settings',
                      trailing: true,
                      onTap: () => null),
                  SizedBox(height: 16.h),
                  ClickOne(
                      image: AppImages.security,
                      text: 'Password & Security',
                      trailing: true,
                      onTap: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
