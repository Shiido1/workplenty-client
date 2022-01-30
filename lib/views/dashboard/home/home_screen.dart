import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/dashboard/widget/home_card_widget.dart';
import 'package:client/views/widgets/modal_bottom.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => showFloatingActionModal(context, 'Select a Service'),
          backgroundColor: Pallets.primary100,
          child: Icon(
            Icons.add,
            color: Pallets.white,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: ListView(children: [
            SizedBox(height: 34.h),
            Row(
              children: [
                Expanded(
                  child: TextView(
                      text: '4500 Jobs Found',
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    TextView(
                        text: 'Sort:',
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w600),
                    SizedBox(width: 5.w),
                    TextView(
                        text: 'Recent',
                        maxLines: 1,
                        color: Pallets.grey,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w600),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            ...[1, 2, 2, 2, 2, 2, 3].map((_) => HomeCard()).toList()
          ]),
        ));
  }
}
