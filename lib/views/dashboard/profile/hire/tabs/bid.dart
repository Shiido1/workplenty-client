import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/views/dashboard/profile/hire/bid_Screen.dart';
import 'package:client/views/dashboard/profile/widget/clicks_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BidTab extends StatelessWidget {
  const BidTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: ListView(
        children: [
          ...[
            1,
            2,
            2,
          ]
              .map((_) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClickOne(
                        text: 'Need a new Landing Page for my Construc...',
                        trailing: true,
                        onTap: () =>
                            PageRouter.gotoWidget(BidScreen(), context)),
                  ))
              .toList()
        ],
      ),
    );
  }
}
