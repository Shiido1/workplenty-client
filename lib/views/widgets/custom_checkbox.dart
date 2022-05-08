import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckBox extends StatelessWidget {
  final dynamic defaultValue;
  final dynamic receivingValue;
  final String? title;
  final Function()? onTap;
  const CustomCheckBox(
      {required this.defaultValue,
      required this.receivingValue,
      required this.title,
      this.onTap,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(defaultValue == receivingValue
              ? Icons.check_box_sharp
              : Icons.check_box_outline_blank),
          SizedBox(width: 8.w),
          Expanded(
            child: TextView(
              text: title!,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}
