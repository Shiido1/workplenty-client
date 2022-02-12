import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/dashboard/gig/domain/source/local/list_of_artisans_dao.dart';
import 'package:client/views/dashboard/gig/presentation/provider/artisan_provider.dart';
import 'package:client/views/dashboard/widget/home_card_widget.dart';
import 'package:client/views/widgets/body_widget.dart';
import 'package:client/views/widgets/modal_bottom.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ArtisanProvider>(context, listen: false).listOfArtisan();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => showFloatingActionModal(context, 'Select a Service'),
          backgroundColor: Pallets.primary100,
          child: Icon(
            Icons.add,
            color: Pallets.white,
          ),
        ),
        body: BodyWidget(
          child: FutureBuilder(
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
                  return ListView(children: [
                    SizedBox(height: 34.h),
                    Row(
                      children: [
                        Expanded(
                          child: TextView(
                              text: '${_jobList.length} Artisans Found',
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            TextView(
                                text: 'Sort:',
                                maxLines: 1,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w600),
                            SizedBox(width: 5.w),
                            TextView(
                                text: 'Recent',
                                maxLines: 1,
                                color: Pallets.grey,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w600),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ..._jobList.map((job) => HomeCard(datum: job)).toList()
                  ]);
                },
              );
            },
          ),
        ));
  }
}
