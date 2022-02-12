import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RowContainer extends StatelessWidget {
  const RowContainer({Key? key, this.image, this.text}) : super(key: key);
  final String? image;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.w),
      child: Row(
        children: [
          SvgPicture.asset(image!),
          SizedBox(width: 10.w),
          TextView(
            text: text!,
            maxLines: 1,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
