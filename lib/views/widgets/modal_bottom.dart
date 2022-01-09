import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/routes/routes.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showFloatingActionModal(BuildContext context, String title,
    {Function()? onPress}) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          // padding: EdgeInsets.all(13.w),
          color: Pallets.white,
          child: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 4.w, right: 4.w),
              child: Column(
                  
                  children: [
                    SizedBox(height: 23.h),
                    TextView(
                      text: title,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Pallets.grey700,
                      textAlign: TextAlign.left,
                    ),
                    Divider(thickness: 1,color: Pallets.grey,),
                    SizedBox(height: 25.h),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                            InkWell(
                              onTap: ()=>PageRouter.gotoNamed(Routes.freelance, context),
                              child: TextView(
                                text: 'Freelance',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Pallets.grey,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            InkWell(
                                                            onTap: ()=>PageRouter.gotoNamed(Routes.home_service, context),

                              child: TextView(
                                text: 'Home Service',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Pallets.grey,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(height: 20.h,),InkWell(
                                                            onTap: ()=>PageRouter.gotoNamed(Routes.consultancy, context),

                              child: TextView(
                                text: 'Live Consultancy',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Pallets.grey,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(height: 50.h,)
                          ],
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        );
      });
}
