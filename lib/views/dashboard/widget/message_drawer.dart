import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/widgets/body_widget.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageDrawerWidget extends StatelessWidget {
  const MessageDrawerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BodyWidget(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 23.h, horizontal: 20.w),
              child: Row(
                children: [
                  Expanded(
                      child: TextView(
                    text: 'Filter',
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.left,
                  )),
                  Expanded(
                      child: TextView(
                    text: 'Clear',
                    color: Pallets.grey,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.right,
                  ))
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: TextView(
                    text: 'Message',
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (bool? value) {}),
                    TextView(
                      text: 'All',
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (bool? value) {}),
                    TextView(
                      text: 'Unread',
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (bool? value) {}),
                    TextView(
                      text: 'Archived',
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (bool? value) {}),
                    TextView(
                      text: 'Spam',
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.left,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
