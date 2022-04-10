import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helper/utils/pallets.dart';
import '../../../../../widgets/text_views.dart';

class AddSkillWidget extends StatelessWidget {
  final Function()? onTap;
  final String? value;
  const AddSkillWidget({this.onTap, this.value, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: Pallets.primary100),
        child: TextView(
            color: Pallets.white,
            text: value ?? '',
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center),
      ),
    );
  }
}
