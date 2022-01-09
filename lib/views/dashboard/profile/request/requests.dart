import 'package:client/views/dashboard/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Requests extends StatelessWidget {
  const Requests({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: getCustomAppBar(context, 'Requests',
            bottom: TabBar(
              tabs: [
                Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Text('Live Consultancy')),
                Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Text('Home Service')),
              ],
            )),
        body: TabBarView(
          children: [
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
