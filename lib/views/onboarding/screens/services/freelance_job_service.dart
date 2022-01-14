import 'package:client/core/helper/helper_handler.dart';
import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/images.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/onboarding/screens/widget/row_container_widget.dart';
import 'package:client/views/widgets/body_widget.dart';
import 'package:client/views/widgets/buttons.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/edit_form_widget.dart';
import 'package:client/views/widgets/image_loader.dart';
import 'package:client/views/widgets/skill_widget.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class FreeLanceJobService extends StatelessWidget {
  FreeLanceJobService({Key? key}) : super(key: key);

  List<String>? _skills = [
    'UI',
    'UX',
    'Web Design',
    'Figma',
    'User Research',
    'Style Guide'
  ];

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
            title: 'Freelance Job'),
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
                image: AppImages.brief_case,
                text: 'Describe your project and other specific details'),
            EditFormField(
              height: 150.h,
              label: 'Type here..',
            ),
            SizedBox(
              height: 60.h,
            ),
            RowContainer(image: AppImages.paper_clip, text: 'Attachment'),
            EditFormField(),
            SizedBox(
              height: 20.h,
            ),
            RowContainer(image: AppImages.brief_case, text: 'Job Category'),
            EditFormField(),
            SizedBox(
              height: 20.h,
            ),
            RowContainer(image: AppImages.document, text: 'Cover Letter'),
            SizedBox(
              height: 4.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (bool? value) {}),
                    TextView(
                      text: 'Required',
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (bool? value) {}),
                    TextView(
                      text: 'Optional',
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (bool? value) {}),
                    TextView(
                      text: 'Not Required',
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            RowContainer(image: AppImages.cup, text: 'Skill'),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 10,
                    children: _skills!
                        .map((element) => SkillsWidget(element))
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                tap('+')
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            RowContainer(image: AppImages.crown, text: 'Experience Level'),
            EditFormField(
                label: 'Intermediate',
                suffixWidget: ImageLoader(
                  path: AppImages.vector,
                )),
            SizedBox(
              height: 20.h,
            ),
            RowContainer(image: AppImages.emptyWallet, text: 'Budget'),
            EditFormField(
              label: 'NGN',
            ),
            SizedBox(
              height: 20.h,
            ),
            RowContainer(image: AppImages.clock, text: 'Timeline'),
            EditFormField(
              label: '1 Week',
              suffixWidget: ImageLoader(path: AppImages.vector),
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
            SizedBox(height: 10.h),
            ButtonWidget(
              buttonText: 'Post Freelance Job & Invite',
              fontSize: 18.sp,
              width: Utils.getDeviceWidth(context),
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

  tap(String value) => Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: Pallets.primary100),
        child: TextView(
            color: Pallets.white,
            text: value,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center),
      );
}
