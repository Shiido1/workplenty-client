import 'package:client/core/helper/utils/images.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

getCustomAppBar(BuildContext context, String title,
    {PreferredSizeWidget? bottom}) {
  return defaultAppBar2(
    context,
    backgroundColor: Pallets.primary100,
    bottom: bottom,
    leadingWidth: 70,
    leadingWidget:
        ImageLoader(path: AppImages.whiteLogo, height: 24.h, width: 24.w),
    centerTitle: true,
    title: title,
    textColor: Pallets.white,
    actions: [
      Container(
          margin: EdgeInsets.only(right: 16.w),
          child: ImageLoader(path: AppImages.bell, onTap: () {}
              //  PageRouter.gotoWidget(NotificationScreen(), context),
              ))
    ],
  );
}
