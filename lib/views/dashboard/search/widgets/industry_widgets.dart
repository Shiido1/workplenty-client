import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/helper/helper_handler.dart';
import '../../../../../core/helper/utils/pallets.dart';
import '../../../../core/entity/datum/datum.model.dart';
import '../../../widgets/image_loader.dart';
import '../../../widgets/text_views.dart';
import '../../gig/presentation/provider/gig_provider.dart';

class IndustryCards extends StatelessWidget {
  const IndustryCards({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Provider.of<GigProvider>(context, listen: false).generalIndustryList();
    return Consumer<GigProvider>(
      builder: (context, setUp, child) {
        if (setUp.generalListOfDatum!.isEmpty) {
          return Container();
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: setUp.generalListOfDatum!
                      .map((data) => _skills(context, data))
                      .toList()),
            ),
            SizedBox(height: 54.h),
          ],
        );
      },
    );
  }

  SizedBox _skills(BuildContext context, Datum? data) {
    return SizedBox(
      width: 200.w,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 148.h,
                width: Utils.getDeviceWidth(context) * .4,
                margin: EdgeInsets.only(right: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                ),
                child: ImageLoader(
                  path: data?.cover?.path ?? '',
                  height: Utils.getDeviceHeight(context),
                  width: Utils.getDeviceWidth(context),
                  fit: BoxFit.cover,
                  isCurvedEdge: true,
                  curve: 5.r,
                ),
              ),
              SizedBox(
                width: Utils.getDeviceWidth(context) * .4,
                child: Container(
                  height: 5.h,
                  width: Utils.getDeviceWidth(context) * .4,
                  margin: EdgeInsets.only(right: 20.w),
                  decoration: BoxDecoration(
                    color: Pallets.grey,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.r),
                        bottomRight: Radius.circular(8.r)),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(
                top: 100.h, left: 16.w, right: 16.w, bottom: 16.h),
            child: TextView(
              text: data?.name ?? '',
              maxLines: 2,
              color: Pallets.white,
              textOverflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
