import 'package:client/core/helper/utils/images.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/core/helper/utils/strings.dart';
import 'package:client/views/widgets/buttons.dart';
import 'package:client/views/widgets/image_loader.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 23.h),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 11.h),
          child: Column(
            children: [
              Row(
                children: [
                  ImageLoader(
                    path: AppImages.pickie,
                  ),
                  SizedBox(
                    width: 13.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: 'Bella Christain',
                          maxLines: 1,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.left,
                        ),
                        TextView(
                          text: 'Software Engineer & Website Manager',
                          maxLines: 1,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  ImageLoader(
                    path: AppImages.bookmark,
                    color: Pallets.primary100,
                    dColor: Pallets.white,
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              TextView(
                text: AppString.cardText,
                maxLines: 3,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.left,
                textOverflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  _buildWidget(AppImages.location, 'Nigeria'),
                  SizedBox(width: 20.w),
                  _buildWidget(AppImages.shield, 'Top Rated'),
                  SizedBox(width: 20.w),
                  _buildWidget(AppImages.emptyWallet, 'Top Earner'),
                  SizedBox(width: 20.w),
                  _buildWidget(AppImages.graph, '99%'),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              ButtonWidget(
                buttonText: 'Invite Artisan',
                onPressed: () {},
                height: 35.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildWidget(String image, String value) {
    return Expanded(
        child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(image),
        SizedBox(width: 5.w),
        Expanded(
          child: TextView(
            text: value,
            maxLines: 1,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.left,
          ),
        )
      ],
    ));
  }
}
