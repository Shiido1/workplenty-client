import 'package:client/core/enums/gig_type.dart';
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

class SavedScreen extends StatefulWidget {
  final Widget? widget;
  const SavedScreen({Key? key, this.widget}) : super(key: key);

  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  SavedGigListProvider? savedGigListProvider;

  @override
  Widget build(BuildContext context) {
    Provider.of<SavedGigListProvider>(context, listen: false).savedGigList();
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
              return ValueListenableBuilder(
                builder: (_, Box<dynamic> value, __) {
                  final _savedGigList =
                      savedGigDao!.getConvertedData(value).toList();
                  return TabBarView(
                    children: [
                      FreelanceTab(
                        datum: _savedGigList
                            .where(
                                (element) => element.type == GigType.freelance)
                            .toList(),
                      ),
                      ServiceTab(),
                      Icon(Icons.directions_bike),
                    ],
                  );
                },
                valueListenable: snapshot.data,
              );
            }),
      ),
    );
  }
}
