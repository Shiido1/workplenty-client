import 'package:client/core/helper/helper_handler.dart';
import 'package:client/views/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroImageWidget extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subTitle;

  const IntroImageWidget({
    Key? key,
    this.image,
    this.title,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageLoader(
            path: image!,
            width: Utils.getDeviceWidth(context),
            height: ScreenUtil().setHeight(510),
            fit: BoxFit.cover,
          ),
          // SizedBox(height: 30.h),
          // TextView(
          //   text: title!,
          //   fontSize: 24.sp,
          //   fontWeight: FontWeight.w600,
          //   textAlign: TextAlign.center,
          // ),
          // SizedBox(height: 10.h),
          // TextView(
          //   text: subTitle!,
          //   textAlign: TextAlign.center,
          //   fontSize: 14.sp,
          //   color: Pallets.grey500,
          //   fontStyle: FontStyle.normal,
          //   fontWeight: FontWeight.w400,
          // )
        ],
      ),
    );
  }
}
