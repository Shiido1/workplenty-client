import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/images.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/onboarding/presentation/screens/widget/row_container_widget.dart';
import 'package:client/views/widgets/body_widget.dart';
import 'package:client/views/widgets/buttons.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/edit_form_widget.dart';
import 'package:client/views/widgets/image_loader.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveConsultancy extends StatelessWidget {
  const LiveConsultancy({Key? key}) : super(key: key);

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
        body: BodyWidget(
          child: ListView(children: [
            SizedBox(
              height: 10.h,
            ),
            Row(children: [
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
            ]),
            SizedBox(
              height: 10.h,
            ),
            RowContainer(
                image: AppImages.message,
                text: 'Private Message to Charles Damien'),
            EditFormField(
              height: 150.h,
              label: 'Type here..',
            ),
            SizedBox(
              height: 10.h,
            ),
            RowContainer(image: AppImages.t_message, text: 'Project Title'),
            EditFormField(),
            SizedBox(
              height: 10.h,
            ),
            RowContainer(
                image: AppImages.t_message,
                text: 'Describe your project and specific details'),
            EditFormField(
              height: 150.h,
              label: 'Type here..',
            ),
            SizedBox(
              height: 60.h,
            ),
            RowContainer(image: AppImages.brief_case, text: 'Session Category'),
            EditFormField(
                label: 'Wed Development',
                suffixWidget: ImageLoader(
                  path: AppImages.vector,
                )),
            SizedBox(
              height: 20.h,
            ),
            RowContainer(
                image: AppImages.calender, text: 'Session Date & Time'),
            EditFormField(
              label: 'Now',
            ),
            SizedBox(
              height: 20.h,
            ),
            RowContainer(image: AppImages.emptyWallet, text: 'Budget per hour'),
            EditFormField(
              label: 'NGN',
            ),
            SizedBox(
              height: 50.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: RowContainer(
                      image: AppImages.arrange, text: 'Invite Artisan'),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Pallets.grey)),
                        child: Icon(
                          Icons.add,
                          size: 13,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            TextView(
              text: 'Charles Damien',
              color: Pallets.grey,
            ),
            SizedBox(
              height: 10.h,
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
            ),
          ]),
        ));
  }
}
