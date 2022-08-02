import 'dart:async';

import 'package:client/core/bus/event_bus.dart';
import 'package:client/core/database/session_manager.dart';
import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/routes/routes.dart';
import 'package:client/core/helper/utils/images.dart';
import 'package:client/views/dashboard/chat/presentation/message_screen.dart';
import 'package:client/views/dashboard/profile/profile.dart';
import 'package:client/views/dashboard/saved/saved_screen.dart';
import 'package:client/views/dashboard/search/search_explore_screen.dart';
import 'package:client/views/dashboard/widget/custom_app_bar.dart';
import 'package:client/views/dashboard/widget/message_drawer.dart';
import 'package:client/views/widgets/image_loader.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'gig/presentation/home/home_screen.dart';
import 'profile/stateManagers/provider/profile_provider.dart';

// ignore: must_be_immutable
class MainBoard extends StatefulWidget {
  final int index;
  const MainBoard({Key? key, this.index = 0}) : super(key: key);

  @override
  _MainBoardState createState() => _MainBoardState();
}

class _MainBoardState extends State<MainBoard> {
  late StreamSubscription indexChangedSub;
  ValueNotifier<int> indexChangedNotifier = ValueNotifier(0);
  int? index = 0;
  List<Widget> _body = [];
  List<String> _bodyTitle = [];

  @override
  void initState() {
    index = widget.index;
    _eventListener();
    super.initState();
  }

  //? listens to events when triggered
  void _eventListener() async {
    final _firebase = await FirebaseMessaging.instance.getToken();
    eventBus.on().listen((event) async {
      if (event is DashboardRouteEvent) {
        indexChangedSub = eventBus
            .on<DashboardRouteEvent>()
            .listen(onSelectedIndexChangedEvent);
      }
      if (event is DrawerEvent) {
        eventBus.on<DrawerEvent>().listen((event) {
          setState(() {});
          if (event.open) Scaffold.of(event.context).openEndDrawer();
        });
      }

      if (event is UserLoggedInEvent) {
        await SessionManager.instance.logOut();
        PageRouter.gotoNamed(Routes.login, context, clearStack: true);
      }
    });
  }

  onSelectedIndexChangedEvent(DashboardRouteEvent event) async {
    if (mounted) {
      setState(() {
        _onTap(event.index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileProvider>(context, listen: false).getUsersProfile();

    _body = [Home(), SavedScreen(), SearchTab(), Profile(), MessageScreen()];
    _bodyTitle = ["Dashboard", "Saved", "Explore", "Profile", "Message"];
    return Scaffold(
      appBar: index == 1 || index == 2 || index == 3 || index == 4
          ? null
          : getCustomAppBar(context, _bodyTitle[index!], isHome: index == 0),
      endDrawer: MessageDrawerWidget(),
      body: AnimatedSwitcher(
          duration: Duration(milliseconds: 400), child: _body[index!]),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  void _onTap(int i) {
    index = i;
    setState(() {});
  }

  ValueListenableBuilder _bottomNavigationBar(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangedNotifier,
        builder: (context, value, widgetValue) => BottomNavigationBar(
              unselectedFontSize: 14,
              selectedFontSize: 14,
              onTap: _onTap,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: ImageLoader(
                      path: index == 0
                          ? AppImages.home_filled
                          : AppImages.home_outlined,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: ImageLoader(
                      path: index == 1
                          ? AppImages.archive_filled
                          : AppImages.archive_outlined,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: ImageLoader(
                      path: index == 2
                          ? AppImages.search_filled
                          : AppImages.search_outlined,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: ImageLoader(
                      path: index == 3
                          ? AppImages.profile_filled
                          : AppImages.profile_outlined,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: ImageLoader(
                      path: index == 4
                          ? AppImages.sms_filled
                          : AppImages.sms_outlined,
                    ),
                    label: ""),
              ],
              currentIndex: index!,
            ));
  }
}
