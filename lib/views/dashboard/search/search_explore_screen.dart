import 'package:client/core/helper/utils/delay.dart';
import 'package:client/views/dashboard/gig/domain/entity/gig/gig_entity.dart';
import 'package:client/views/dashboard/gig/presentation/provider/artisan_provider.dart';
import 'package:client/views/widgets/empty_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import '../../../core/bus/event_bus.dart';
import '../../../core/helper/utils/images.dart';
import '../../widgets/image_loader.dart';
import '../../widgets/search_field.dart';
import '../../widgets/text_views.dart';
import '../gig/domain/source/local/list_of_artisans_dao.dart';
import '../widget/custom_app_bar.dart';
import '../widget/home_card_widget.dart';
import 'widgets/industry_widgets.dart';

class SearchTab extends StatefulWidget {
  SearchTab({Key? key}) : super(key: key);

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final _delay = Delay();
  ArtisanProvider? _artisanProvider;

  @override
  void initState() {
    _artisanProvider = Provider.of<ArtisanProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(context, 'Explore', isHome: true),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: ListView(
          children: [
            SizedBox(height: 23.h),
            SearchAndFilter(
              hint: 'Search for talents',
              showFilter: false,
              onFilter: () => eventBus.fire(DrawerEvent(context, true)),
              onChanged: (v) => _delay.run(() => _artisanProvider
                  ?.listOfArtisan(entity: GigEntity(searchKeyWord: v))),
            ),
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
                    return _jobList.isEmpty
                        ? EmptyWidget()
                        : Column(mainAxisSize: MainAxisSize.min, children: [
                            ..._jobList
                                .map((job) => HomeCard(datum: job))
                                .toList()
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
