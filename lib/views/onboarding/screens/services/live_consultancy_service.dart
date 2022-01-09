import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/images.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/widgets/buttons.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/edit_form_widget.dart';
import '../../../widgets/image_loader.dart';

class LiveConsultancy extends StatelessWidget {
  const LiveConsultancy({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: defaultAppBar2(context,
            leadingWidget: IconButton(
              color: Pallets.white,
              icon: Icon(Icons.clear),
              onPressed: () => PageRouter.goBack(context),
            ),
            textColor: Pallets.white,
            title: 'Live Consultancy'),
        body: ListView(children: [
          SizedBox(
            height: 10.h,
          ),
          Container(
              padding: EdgeInsets.all(8.w),
              child: Row(children: [
                SizedBox(
                  width: 30.w,
                ),
                ImageLoader(
                  path: AppImages.pickie,
                ),
                SizedBox(
                  width: 13.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'Charles Damien',
                      maxLines: 1,
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      textAlign: TextAlign.left,
                    ),
                    TextView(
                      text: 'Technical Writer',
                      maxLines: 1,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.left,
                    ),
                  ],
                )
              ])),
          Container(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ImageLoader(
                      path: AppImages.message,
                    ),
                    TextView(
                      text: 'Privaite Message to Charles Damien',
                      maxLines: 1,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: EditFormField(
                    height: 150.h,
                    label: 'Type here..',
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    ImageLoader(
                      path: AppImages.t_message,
                    ),
                    TextView(
                      text: 'Project Title',
                      maxLines: 1,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: EditFormField(
                    height: 40.h,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    ImageLoader(
                      path: AppImages.t_message,
                    ),
                    TextView(
                      text: 'Describe your project and other specific details',
                      maxLines: 1,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: EditFormField(
                    height: 150.h,
                    label: 'Type here..',
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    ImageLoader(
                      path: AppImages.brief_case,
                    ),
                    TextView(
                      text: 'Session Category',
                      maxLines: 1,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: EditFormField(
                      height: 40.h,
                      label: 'Wed Development',
                      suffixWidget: ImageLoader(
                        path: AppImages.vector,
                      )),
                ),

                
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    ImageLoader(
                      path: AppImages.calender,
                    ),
                    TextView(
                      text: 'Session Date &Time',
                      maxLines: 1,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: EditFormField(
                    height: 40.h,
                    label: 'Now',
                  ),
                ),
                Row(
                  children: [
                    ImageLoader(
                      path: AppImages.emptyWallet,
                    ),
                    TextView(
                      text: 'Budget per hour',
                      maxLines: 1,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: EditFormField(
                    height: 40.h,
                    label: 'NGN',
                  ),
                ),
                
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        ImageLoader(
                          path: AppImages.arrange,
                        ),
                        TextView(
                          text: 'Invite Artisan',
                          maxLines: 1,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        TextView(
                          text: 'Invite',
                          maxLines: 1,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: Pallets.grey)),
                          child: Icon(
                            Icons.add,
                            size: 13,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 40,
                    top: 16,
                  ),
                  child: TextView(
                    text: 'Charles Damien',
                    color: Pallets.grey,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                ButtonWidget(
                  buttonText: 'Start Session & Invite Artisan',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  onPressed: () {},
                  height: 55.h,
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ]));
  }
}
