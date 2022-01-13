import 'package:client/core/bus/event_bus.dart';
import 'package:client/core/helper/helper_handler.dart';
import 'package:client/core/helper/utils/images.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/dashboard/widget/home_card_widget.dart';
import 'package:client/views/widgets/image_loader.dart';
import 'package:client/views/widgets/search_field.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _color = [Color(0xff11406C), Color(0xff574C6B), Color(0xffC37F6C)];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: ListView(
          children: [
            SearchAndFilter(
              onFilter: () {
                  eventBus.fire(DrawerEvent(context, true));
                }
            ),
            SizedBox(height: 20.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ..._color.map((e) => imageContainer(context, e)).toList()
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(children: [
              ImageLoader(path: AppImages.emoji),
              SizedBox(width: 5.w),
              Expanded(
                  child: TextView(
                text: 'Featured Talents',
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

  imageContainer(BuildContext context, Color e) => SizedBox(
        width: 200.w,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 148,
                  width: Utils.getDeviceWidth(context) * .4,
                  margin: EdgeInsets.only(right: 16.w),
                  decoration: BoxDecoration(
                    color: e,
                    borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  ),
                ),
                SizedBox(
                  width: Utils.getDeviceWidth(context) * .4,
                  child: Container(
                    height: 5.h,
                    width: Utils.getDeviceWidth(context) * .4,
                    margin: EdgeInsets.only(right: 20.w),
                    decoration: BoxDecoration(
                      color: Pallets.grey,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.r),
                          bottomRight: Radius.circular(8.r)),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 100.h, left: 12.w, right: 16.w, bottom: 6.h),
              child: TextView(
                text: 'Designs, Media &\n Architecture',
                maxLines: 2,
                color: Pallets.white,
                textOverflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      );
}
