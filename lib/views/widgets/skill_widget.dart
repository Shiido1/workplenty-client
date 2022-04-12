import 'package:client/core/entity/skills/skill.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkillsWidget extends StatelessWidget {
  final Skill value;
  const SkillsWidget(this.value, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: Color.fromRGBO(16, 55, 92, .1)),
      child: TextView(
          text: value.name ?? '',
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center),
    );
  }
}
