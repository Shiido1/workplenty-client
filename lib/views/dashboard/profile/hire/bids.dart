import 'package:client/views/dashboard/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'tabs/bid.dart';
import 'tabs/interview.dart';

class Hire extends StatelessWidget {
  const Hire({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: getCustomAppBar(context, 'Hire',
            bottom: TabBar(
              tabs: [
                Container(
                    margin: EdgeInsets.only(bottom: 10.h), child: Text('Bid')),
                Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Text('Hired Artisan')),
              ],
            )),
        body: TabBarView(
          children: [
            BidTab(),
            InterviewTab(),
          ],
        ),
      ),
    );
  }
}
