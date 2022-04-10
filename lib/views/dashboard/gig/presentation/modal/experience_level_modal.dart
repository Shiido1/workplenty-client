import 'package:client/core/helper/helper_handler.dart';
import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExperienceLevel {
  final String? title;
  final int? value;

  ExperienceLevel(this.title, this.value);

  static List<ExperienceLevel> getLevels() {
    List<ExperienceLevel> _data = [];
    ExperienceLevel _d = ExperienceLevel('Entry', 0);
    _data.add(_d);
    _d = ExperienceLevel('Intermediate', 1);
    _data.add(_d);
    _d = ExperienceLevel('Mid-Level', 2);
    _data.add(_d);
    _d = ExperienceLevel('Senior', 3);
    _data.add(_d);
    return _data;
  }
}

// ignore: must_be_immutable
class ExperienceLevelModal extends StatelessWidget {
  final Function(ExperienceLevel? value)? onTap;
  const ExperienceLevelModal({this.onTap, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Utils.getDeviceHeight(context) * .4,
      child: Scaffold(
        appBar: defaultAppBar(context,
            title: 'Experience Level',
            centerTitle: true,
            showClearButton: false),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView(
            children: [
              ...ExperienceLevel.getLevels()
                  .map(
                    (element) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {
                        onTap!(element);
                        PageRouter.goBack(context);
                      },
                      title: TextView(
                        text: element.title!,
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
