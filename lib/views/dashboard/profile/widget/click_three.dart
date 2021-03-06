import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/widgets/image_loader.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClickThree extends StatelessWidget {
  final Function()? onTap;
  final String? image;
  final String? text, text1, text2;
  final Widget? widget;

  final bool? trailing;
  final MainAxisAlignment? mainAxisAlignment;
  const ClickThree(
      {this.onTap,
      this.image,
      this.text,
      this.text1,
      this.text2,
      this.widget,
      this.mainAxisAlignment,
      this.trailing = false,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10.w),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
                text: text ?? '',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextView(
                    text: text1 ?? '',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    maxLines: 1,
                    color: Pallets.grey,
                    textOverflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left),
                Spacer(),
                Row(
                  children: [
                    ImageLoader(
                      path: image,
                    ),
                    SizedBox(width: 8.w),
                    TextView(
                        text: text2 ?? '',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        maxLines: 1,
                        color: Pallets.grey,
                        textOverflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
