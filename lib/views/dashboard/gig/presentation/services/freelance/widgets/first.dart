import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

import '../../../../../../widgets/image_loader.dart';
import '../../../../../../widgets/review_bg_card.dart';
import '../../../../../../widgets/text_views.dart';
import '../../../provider/artisan_provider.dart';

class First extends StatelessWidget {
  const First({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ArtisanProvider>(
      builder: (context, value, child) {
        return ReviewBgCard(
          Row(mainAxisSize: MainAxisSize.min, children: [
            CircularImage(
              path: value.datum?.user?.avatar ?? '',
              radius: 22,
            ),
            SizedBox(
              width: 13.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text:
                        '${value.datum?.user?.firstName ?? ''} ${value.datum?.user?.lastName??''}',
                    maxLines: 1,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    textAlign: TextAlign.left,
                  ),
                  TextView(
                    text: value.datum?.profile?.description ?? '',
                    maxLines: 1,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            )
          ]),
          borderRadiusGeometry: BorderRadius.zero,
          vertical: 25.33,
        );
      },
    );
  }
}
