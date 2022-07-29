import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/dashboard/gig/domain/entity/gig/gig_entity.dart';
import 'package:client/views/dashboard/gig/domain/source/local/list_of_artisans_dao.dart';
import 'package:client/views/dashboard/gig/presentation/provider/artisan_provider.dart';
import 'package:client/views/dashboard/milestone/milestone.dart';
import 'package:client/views/dashboard/widget/home_card_widget.dart';
import 'package:client/views/widgets/body_widget.dart';
import 'package:client/views/widgets/empty_widget.dart';
import 'package:client/views/widgets/image_loader.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../../../core/enums/viewstate.dart';
import '../../../../../core/helper/utils/images.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ArtisanProvider? _artisanProvider;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    _artisanProvider = Provider.of<ArtisanProvider>(context, listen: false);
    super.initState();
  }

  void _refresh() async {
    try {
      await _artisanProvider?.listOfArtisan();
      _refreshController.refreshCompleted();
    } catch (e) {
      _refreshController.refreshFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SpeedDial(
          icon: Icons.add,
          activeIcon: Icons.close,
          backgroundColor: Pallets.primary100,
          foregroundColor: Colors.white,
          activeBackgroundColor: Pallets.primary100,
          activeForegroundColor: Colors.white,
          buttonSize: Size(56.0, 56.0),
          visible: true,
          closeManually: false,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          elevation: 4.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
              backgroundColor: Pallets.primary100,
              foregroundColor: Pallets.primary100,
              label: 'Post a Gig',
              labelStyle: TextStyle(fontSize: 14.sp),
              child: Icon(Icons.add, color: Colors.white),
              onTap: () => print('FIRST CHILD'),
            ),
            SpeedDialChild(
              backgroundColor: Pallets.primary100,
              foregroundColor: Pallets.primary100,
              label: 'Home Service',
              labelStyle: TextStyle(fontSize: 14.sp),
              child: ImageLoader(path: AppImages.layer),
              onTap: () => print('FIRST CHILD'),
            ),
            SpeedDialChild(
              backgroundColor: Pallets.primary100,
              foregroundColor: Pallets.primary100,
              label: 'Live Consultancy',
              labelStyle: TextStyle(fontSize: 14.sp),
              child: ImageLoader(path: AppImages.video),
              onTap: () => print('FIRST CHILD'),
            ),
          ],
        ),
        body: BodyWidget(
          child: FutureBuilder(
            future: listOfArtisansDao!.getListenable(),
            builder: (BuildContext context,
                AsyncSnapshot<ValueListenable<Box<dynamic>>?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  !snapshot.hasData) return Container();

              _refresh();

              return ValueListenableBuilder(
                valueListenable: snapshot.data!,
                builder: (_, Box<dynamic> value, __) {
                  final _jobList = listOfArtisansDao!
                      .getConvertedData(listOfArtisansDao!.box!)
                      .toList();
                  return Consumer<ArtisanProvider>(
                    builder: (context, provider, child) {
                      if (provider.state == ViewState.busy) {
                        return SpinKitCircle(color: Pallets.blue, size: 50.0);
                      }
                      return SmartRefresher(
                        controller: _refreshController,
                        enablePullDown: true,
                        enablePullUp: false,
                        onRefresh: () => _refresh(),
                        header: WaterDropHeader(),
                        child: _jobList.isEmpty
                            ? EmptyWidget()
                            : ListView(children: [
                                SizedBox(height: 34.h),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextView(
                                          text:
                                              '${_jobList.length} Artisans Found',
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
                                            fontWeight: FontWeight.w400),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                ..._jobList
                                    .map((job) => HomeCard(datum: job))
                                    .toList()
                              ]),
                      );
                    },
                  );
                },
              );
            },
          ),
        ));
  }
}
