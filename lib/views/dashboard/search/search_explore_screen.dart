import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../core/enums/viewstate.dart';
import '../../../core/bus/event_bus.dart';
import '../../../core/helper/utils/images.dart';
import '../../../core/helper/utils/pallets.dart';
import '../../widgets/image_loader.dart';
import '../../widgets/search_field.dart';
import '../../widgets/text_views.dart';
import '../gig/domain/source/local/list_of_artisans_dao.dart';
import '../widget/home_card_widget.dart';
import 'widgets/industry_widgets.dart';

class SearchTab extends StatelessWidget {
  SearchTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: ListView(
          children: [
            SizedBox(height: 23.h),
            SearchAndFilter(
                hint: 'Search for gigs, live consultancy, home',
                onFilter: () {
                  eventBus.fire(DrawerEvent(context, true));
                }),
            SizedBox(height: 23.h),
            IndustryCards(),
            Row(children: [
              ImageLoader(path: AppImages.emoji),
              SizedBox(width: 5.w),
              Expanded(
                  child: TextView(
                text: 'Featured Talents',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.left,
              ))
            ]),
            SizedBox(height: 16.h),
            FutureBuilder(
              future: listOfArtisansDao!.getListenable(),
              builder: (BuildContext context,
                  AsyncSnapshot<ValueListenable<Box<dynamic>>?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting ||
                    !snapshot.hasData) return Container();

                return ValueListenableBuilder(
                  valueListenable: snapshot.data!,
                  builder: (_, Box<dynamic> value, __) {
                    final _jobList = listOfArtisansDao!
                        .getConvertedData(listOfArtisansDao!.box!)
                        .toList();
                    return Column(mainAxisSize: MainAxisSize.min, children: [
                      ..._jobList.map((job) => HomeCard(datum: job)).toList()
                    ]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
