import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/routes/navigation.dart';
import '../../../../core/helper/routes/routes.dart';
import '../../../../core/helper/utils/pallets.dart';
import '../../../widgets/text_views.dart';

class SelectServiceModal extends StatelessWidget {
  final String? title;
  const SelectServiceModal(this.title, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 23.h),
            Align(
              alignment: Alignment.center,
              child: TextView(
                text: title ?? '',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Pallets.grey700,
                textAlign: TextAlign.center,
              ),
            ),
            Divider(
              thickness: 1,
              color: Pallets.grey,
            ),
            SizedBox(height: 25.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    PageRouter.goBack(context);
                    PageRouter.gotoNamed(Routes.freelance, context, args: true);
                  },
                  child: TextView(
                    text: 'Freelance',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Pallets.grey,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  onTap: () {
                    PageRouter.goBack(context);
                    PageRouter.gotoNamed(Routes.home_service, context,
                        args: true);
                  },
                  child: TextView(
                    text: 'Home Service',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Pallets.grey,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  onTap: () {
                    PageRouter.goBack(context);
                    PageRouter.gotoNamed(Routes.consultancy, context,
                        args: true);
                  },
                  child: TextView(
                    text: 'Live Consultancy',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Pallets.grey,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 50.h)
              ],
            )
          ]),
        ),
      ),
    );
  }
}
