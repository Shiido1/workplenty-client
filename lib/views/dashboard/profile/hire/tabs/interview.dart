
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InterviewTab extends StatelessWidget {
  const InterviewTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: ListView(
        children: [
          // ...[1, 2, 2, 2, 2, 2, 3].map((_) => CardWidget()).toList()
        ],
      ),
    );
  }
}
