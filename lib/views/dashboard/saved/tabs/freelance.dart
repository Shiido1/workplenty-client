import 'package:client/views/dashboard/widget/home_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FreelanceTab extends StatelessWidget {
  const FreelanceTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: ListView(
        children: [
          ...[1, 2, 2, 2, 2, 2, 3].map((_) => HomeCard()).toList()
        ],
      ),
    );
  }
}
