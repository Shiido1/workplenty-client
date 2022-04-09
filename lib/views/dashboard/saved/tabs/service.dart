import 'package:client/core/helper/utils/images.dart';
import 'package:client/views/dashboard/widget/home_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ServiceTab extends StatelessWidget {
  const ServiceTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (1 < 10) {
      return Center(
        child: SvgPicture.asset(AppImages.empty),
      );
    }
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: ListView(
        children: [
          ...[1, 2, 2, 2, 2, 2, 3].map((_) => HomeCard()).toList()
        ],
      ),
    );
  }
}
