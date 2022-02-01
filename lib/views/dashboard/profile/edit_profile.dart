import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/images.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/review/review.dart';
import 'package:client/views/widgets/star_rating.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/clicks_two.dart';
import 'widget/profile_image_two.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileImageCardTwo(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32.h),
                  ClickTwo(
                      image: AppImages.edit_circle,
                      text: 'Company Bio',
                      widget: TextView(
                          textAlign: TextAlign.left,
                          text:
                              '''WorkPlenty Inc\nLorem ipsum dolor sit amet, consectetur adipiscing 
elit. Euismod eu eu erat nisl consectetur adipiscing.'''),
                      onTap: () {}),
                  SizedBox(height: 32.h),
                  ClickTwo(
                      image: AppImages.edit_circle,
                      text: 'Average Pay Rate',
                      widget: TextView(
                          textAlign: TextAlign.left,
                          text:
                              '''Home Service : NGN3000/hr\nLive Consultancy : NGN1500/5min'''),
                      onTap: () {}),
                  SizedBox(height: 32.h),
                  ClickTwo(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      text: 'Ratings',
                      widget: TextView(
                          textAlign: TextAlign.left,
                          text:
                              '''Average Rating:  4.7\nTotal Rating:  231\nJobs Completed:  190'''),
                      onTap: () {}),
                  SizedBox(height: 32.h),
                  ClickTwo(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      text: 'Reviews',
                      widget: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              StarRating(rating: 4.0, color: Pallets.gold),
                              Expanded(
                                child: TextView(
                                  textAlign: TextAlign.right,
                                  text: '1 week ago',
                                  maxLines: 1,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5.h),
                          TextView(
                              textAlign: TextAlign.left,
                              text:
                                  '''John Doe\nLorem ipsum do whatever i want lol''')
                        ],
                      ),
                      onTap: () => PageRouter.gotoWidget(Review(), context)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
