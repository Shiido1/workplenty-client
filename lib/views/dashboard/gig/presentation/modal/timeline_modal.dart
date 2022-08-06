import 'package:client/core/helper/helper_handler.dart';
import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class TimelineModal extends StatelessWidget {
  final Function(String? value)? onTap;
  const TimelineModal({this.onTap, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Utils.getDeviceHeight(context) * .4,
      child: Scaffold(
        appBar: defaultAppBar(context,
            title: 'Home Service Duration',
            centerTitle: true,
            showClearButton: false),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView(
            children: [
              ...['1 Week', '2 Weeks', '1 Month', '1 Year']
                  .map(
                    (element) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {
                        onTap!(element);
                        PageRouter.goBack(context);
                      },
                      title: TextView(
                        text: element,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ),
                  )
                  .toList()
            ],
          ),
        ),
      ),
    );
  }
}
