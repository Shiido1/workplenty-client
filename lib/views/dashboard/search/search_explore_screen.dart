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
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: ListView(
          children: [
            SearchAndFilter(),
            SizedBox(height: 20.h),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  imageContainer(
                      text: 'Website, IT &\n Software', image: AppImages.web),
                  imageContainer(
                      text: 'Designs, Media &\n Architecture',
                      image: AppImages.design),
                  imageContainer(
                      text: 'Writing &\n Content', image: AppImages.content),
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

  imageContainer({BuildContext? context, String? image, String? text}) => Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image!),
                fit: BoxFit.fill,
                colorFilter: new ColorFilter.mode(
                    Pallets.white.withOpacity(0.7), BlendMode.dstATop),
              ),
            ),
            width: 170.w,
          ),
          Positioned(
            bottom: 10,
            left: 5,
            child: TextView(
                maxLines: 2,
                textOverflow: TextOverflow.ellipsis,
                fontSize: 21.sp,
                text: text!,
                fontWeight: FontWeight.w700,
                color: Pallets.white),
          )
        ]),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
      );
}
