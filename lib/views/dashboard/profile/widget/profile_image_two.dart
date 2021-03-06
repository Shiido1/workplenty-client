import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/images.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/widgets/image_loader.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileImageCardTwo extends StatelessWidget {
  const ProfileImageCardTwo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 80.h, left: 16.w, right: 16.w, bottom: 16.w),
      decoration: new BoxDecoration(
          color: Pallets.primary100,
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: new AssetImage(AppImages.union),
          ),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => PageRouter.goBack(context),
                  icon: Icon(Icons.arrow_back, color: Pallets.white)),
              TextView(
                  text: 'Edit Profile',
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: Pallets.white,
                  textAlign: TextAlign.center),
              ImageLoader(
                path: AppImages.bell,
                // onTap: () =>
                //     PageRouter.gotoWidget(NotificationScreen(), context),
              )
            ],
          ),
          SizedBox(height: 55.h),
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(23),
                child: CircleAvatar(radius: 60.r),
              ),
              Positioned(
                  left: 110.w,
                  top: 20.h,
                  child: ImageLoader(path: AppImages.pen))
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextView(
                  text: 'Daniel James',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Pallets.white,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                decoration: BoxDecoration(
                    color: Pallets.orange600,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Pallets.orange600)),
                child: TextView(
                    text: 'Client',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Pallets.white,
                    textAlign: TextAlign.center),
              )
            ],
          ),
          SizedBox(height: 22.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppImages.location,
                color: Pallets.white,
              ),
              SizedBox(width: 4.w),
              TextView(
                  text: 'Abuja, Nigeria',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Pallets.grey100,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left),
            ],
          ),
        ],
      ),
    );
  }
}
