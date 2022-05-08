import 'package:client/core/enums/gig_type.dart';
import 'package:client/core/helper/configs/instances.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/dashboard/gig/domain/source/local/saved_gig_dao.dart';
import 'package:client/views/dashboard/gig/presentation/provider/saved_gig_list_provider.dart';
import 'package:client/views/dashboard/saved/tabs/freelance.dart';
import 'package:client/views/dashboard/saved/tabs/service.dart';
import 'package:client/views/dashboard/widget/custom_app_bar.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SavedScreen extends StatefulWidget {
  final Widget? widget;
  const SavedScreen({Key? key, this.widget}) : super(key: key);

  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  SavedGigListProvider? savedGigListProvider;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    savedGigListProvider =
        Provider.of<SavedGigListProvider>(context, listen: false);
    _refresh();
    super.initState();
  }

  void _refresh() async {
    try {
      await savedGigListProvider?.savedGigList();
      _refreshController.refreshCompleted();
    } catch (e) {
      _refreshController.refreshFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: getCustomAppBar(context, 'Saved',
            bottom: TabBar(
              tabs: [
                Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: TextView(
                      text: 'Freelance',
                      color: Pallets.white,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: TextView(
                      text: 'Home Service',
                      color: Pallets.white,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: TextView(
                      text: 'Live Consultancy',
                      color: Pallets.white,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                    )),
              ],
            )),
        body: FutureBuilder(
            future: savedGigDao?.getListenable(),
            builder: (_, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  !snapshot.hasData) {
                return Container();
              }
              return SmartRefresher(
                controller: _refreshController,
                enablePullDown: true,
                enablePullUp: false,
                onRefresh: () => _refresh(),
                header: WaterDropHeader(),
                child: ValueListenableBuilder(
                  builder: (_, Box<dynamic> value, __) {
                    final _savedGigList =
                        savedGigDao!.getConvertedData(value).toList();
                    return TabBarView(
                      children: [
                        FreelanceTab(
                            datum: _savedGigList
                                .where((element) =>
                                    element.type == GigType.FREELANCE)
                                .toList()),
                        FreelanceTab(
                            datum: _savedGigList
                                .where(
                                    (element) => element.type == GigType.HOME_SERVICE)
                                .toList()),
                        FreelanceTab(
                            datum: _savedGigList
                                .where(
                                    (element) => element.type == GigType.LIVE_SESSION)
                                .toList()),
                      ],
                    );
                  },
                  valueListenable: snapshot.data,
                ),
              );
            }),
      ),
    );
  }
}
