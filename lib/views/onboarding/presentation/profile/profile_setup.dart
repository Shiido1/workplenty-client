import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/images.dart';
import 'package:client/views/widgets/body_widget.dart';
import 'package:client/views/widgets/buttons.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/image_loader.dart';
import 'package:client/views/widgets/stacked_container.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'create_profile.dart';

class SetUpProfile extends StatelessWidget {
  const SetUpProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar2(context,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leadingWidth: 70,
          leadingWidget: ImageLoader(
            path: AppImages.logo,
            height: 24.h,
            width: 24.w,
          ),
          centerTitle: true,
          title: 'Profile Setup'),
      body: BodyWidget(
        height: 0,
        width: 0,
        child: Stack(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                StackedContainer(AppImages.computer),
                SizedBox(height: 16.h),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'Hi John',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 16.h),
                      TextView(
                        text:
                            'Nulla tincidunt elit eros, ut gravida eros elementum eget. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nunc non turpis non tellus lacinia sollicitudin nec id augue.',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                alignment: Alignment.bottomCenter,
                child: ButtonWidget(
                    buttonText: 'Proceed',
                    onPressed: () =>
                        PageRouter.gotoWidget(CreateProfile(), context))),
          ],
        ),
      ),
    );
  }
}
