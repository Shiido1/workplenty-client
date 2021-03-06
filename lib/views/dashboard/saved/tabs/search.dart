import 'package:client/core/helper/utils/images.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/dashboard/widget/home_card_widget.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/image_loader.dart';
import 'package:client/views/widgets/search_field.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTabjc extends StatelessWidget {
  const SearchTabjc({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar2(context,
          backgroundColor: Pallets.primary100,
          leadingWidth: 70,
          leadingWidget:
              ImageLoader(path: AppImages.whiteLogo, height: 24.h, width: 24.w),
          centerTitle: true,
          title: 'Explore',
          textColor: Pallets.white,
          actions: [
            Container(
                margin: EdgeInsets.only(right: 16.w),
                child: ImageLoader(path: AppImages.bell, onTap: () => {}
                    // PageRouter.gotoWidget(NotificationScreen(), context),
                    ))
          ]),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: ListView(
          children: [
            SearchAndFilter(),
            SizedBox(height: 16.h),
            Row(children: [
              ImageLoader(path: AppImages.emoji),
              SizedBox(width: 5.w),
              Expanded(
                  child: TextView(
                text: 'Featured Gigs',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.left,
              ))
            ]),
            ...[1, 2, 2, 2, 2, 2, 3].map((_) => HomeCard()).toList()
          ],
        ),
      ),
    );
  }
}
