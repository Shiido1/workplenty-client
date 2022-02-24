import 'package:client/core/helper/utils/images.dart';
import 'package:client/views/dashboard/gig/data/model/list_of_artisan_response/datum.dart';
import 'package:client/views/dashboard/widget/home_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FreelanceTab extends StatelessWidget {
  final List<Datum> datum;
  const FreelanceTab({Key? key, required this.datum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (datum.isEmpty) {
      return Center(child: SvgPicture.asset(AppImages.empty));
    }
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: ListView(
        children: [
          SizedBox(height: 16.h),
          ...datum.map((data) => HomeCard(datum: data)).toList()
        ],
      ),
    );
  }
}
