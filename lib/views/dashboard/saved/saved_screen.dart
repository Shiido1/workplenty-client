import 'package:client/views/dashboard/saved/tabs/freelance.dart';
import 'package:client/views/dashboard/saved/tabs/service.dart';
import 'package:client/views/dashboard/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedScreen extends StatefulWidget {
  final Widget? widget;
  const SavedScreen({Key? key, this.widget}) : super(key: key);

  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: getCustomAppBar(context, 'Saved',
            bottom: TabBar(
              tabs: [
                Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Text('Freelance')),
                Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Text('Home Service')),
                Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Text('Live Consultancy')),
              ],
            )),
        body: TabBarView(
          children: [
            FreelanceTab(),
            ServiceTab(),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
