import 'package:client/core/helper/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gig/data/model/saved_gig_list/datum.model.dart';
import '../../widget/freelance_home_card_widget.dart';

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
          ...datum.map((saved) => FreelanceHomeCard(
            datum: saved,
          )).toList()
        ],
      ),
    );
  }
}
