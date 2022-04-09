import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/images.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/image_loader.dart';
import 'package:client/views/widgets/modal_bottom.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BidScreen extends StatelessWidget {
  const BidScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar2(context,
          showClearButton: false,
          leadingWidget: IconButton(
              onPressed: () => PageRouter.goBack(context),
              icon: Icon(
                Icons.arrow_back,
                color: Pallets.white,
              )),
          centerTitle: true,
          textColor: Pallets.white,
          title: 'Bid'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            TextView(
              text: 'Need a new Landing Page for my Jewellery Business',
              fontWeight: FontWeight.w700,
              fontSize: 18.sp,
              color: Pallets.black,
            ),
            SizedBox(
              height: 16.sp,
            ),
            Row(
              children: [
                ImageLoader(
                  path: AppImages.webgroup,
                ),
                SizedBox(
                  width: 5.w,
                ),
                TextView(
                  text: 'Wed Development',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: Pallets.black,
                ),
              ],
            ),
            Row(
              children: [
                ImageLoader(path: AppImages.calender),
                SizedBox(
                  width: 5.w,
                ),
                TextView(
                  text: 'Posted 5min ago',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: Pallets.black,
                ),
              ],
            ),
            SizedBox(
              height: 68.h,
            ),
            TextView(
              text:
                  '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Gravida enim lobortis aliquet cursus maecenas ultricies vestibulum odio sapien. Enim neque, libero viverra integer. Sit tempor eleifend id congue ultrices interdum eu sodales sit. Orci, eget euismod odio eleifend nullam tortor lectus aliquam. Mattis netus non turpis nibh interdum faucibus id pellentesque. Et quis suspendisse enim lorem ipsum. Velit, dui, eget egestas nec euismod eget lectus ullamcorper adipiscing. Dolor aliquam in pulvinar vitae id ipsum ac sit eu. Eget elementum at bibendum faucibus dui. Id a et, amet accumsan. Amet pellentesque aliquam senectus est. Id sed pulvinar pulvinar justo, vulputate maecenas sit nibh non. Justo in orci, quam dignissim arcu suscipit nec.
Nullam cras congue nec pulvinar vitae tellus quis lorem a. ''',
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: Pallets.black,
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              children: [
                ImageLoader(
                  path: AppImages.webgroup,
                ),
                SizedBox(
                  width: 5.w,
                ),
                TextView(
                  text: 'Bids',
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: Pallets.black,
                ),
                SizedBox(
                  height: 13.h,
                ),
              ],
            ),
            ...[1, 2, 3].map((e) => bidWidget(context)).toList()
          ],
        ),
      ),
    );
  }

  bidWidget(BuildContext context) => GestureDetector(
        onTap: () => showBidModal(context, 'Daniel Herman Bid'),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImageLoader(
                    radius: 20,
                    path: AppImages.pickie,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  TextView(
                    text: 'Daniel Herman',
                    fontSize: 16.sp,
                  ),
                  Spacer(),
                  TextView(
                    text: 'See bid',
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
              Divider(
                thickness: 0.5,
                color: Pallets.grey,
              )
            ],
          ),
        ),
      );
}
