import 'package:client/core/helper/utils/images.dart';
import 'package:client/views/dashboard/profile/widget/click_three.dart';
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
          ...[
            1,
            2,
          ]
              .map((_) => ClickThree(
                  text1: 'Hired Artisan',
                  text2: 'Daniel Herman',
                  image: AppImages.pickie,
                  text: 'Need a new Landing Page for my Construc...',
                  trailing: true,
                  onTap: () {}))
              .toList()
        ],
      ),
    );
  }
}
