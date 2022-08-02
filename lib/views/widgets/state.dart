import 'package:client/views/onboarding/data/model/location_response/datum.dart';
import 'package:client/views/onboarding/presentation/profile/provider/location/location_provider.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/enums/viewstate.dart';
import '../../core/helper/helper_handler.dart';
import '../../core/helper/routes/navigation.dart';
import '../../core/helper/utils/pallets.dart';
import 'default_appbar.dart';

class StatesLocation extends StatelessWidget {
  final Function(Datum d)? onTap;
  const StatesLocation({required this.onTap, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Provider.of<LocationProvider>(context, listen: false).fetchStates();
    return Consumer<LocationProvider>(
      builder: (context, provider, child) {
        return Container(
            height: Utils.getDeviceHeight(context) * .6,
            child: Scaffold(
              appBar: defaultAppBar2(context,
                  showLeading: false,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  centerTitle: true,
                  title: 'Select State',
                  elevation: 1),
              body: Padding(
                padding: EdgeInsets.all(16.w),
                child: ListView(
                  children: [
                    if (provider.state == ViewState.busy)
                      LinearProgressIndicator(color: Pallets.primary50),
                    ...provider.states!
                        .map((data) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              child: TextView(
                                text: data.name ?? '',
                                textAlign: TextAlign.left,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                onTap: () {
                                  onTap!(data);
                                  Provider.of<LocationProvider>(context,
                                          listen: false)
                                      .setStateValue(data);
                                  PageRouter.goBack(context);
                                },
                              ),
                            ))
                        .toList()
                  ],
                ),
              ),
            ));
      },
    );
  }
}
