import 'package:client/core/bus/event_bus.dart';
import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/dashboard/chat/presentation/chats.dart';
import 'package:client/views/widgets/search_field.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/custom_app_bar.dart';
import 'chats.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(context, 'Messages', isHome: true),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            SearchAndFilter(onFilter: () {
              eventBus.fire(DrawerEvent(context, true, value: 2));
            }),
            SizedBox(height: 16.h),
            Expanded(
                child: ListView(
              children: [
                ...ChatModel.getChatsList()
                    .map((chat) => GestureDetector(
                          onTap: () =>
                              PageRouter.gotoWidget(ChatsScreen(), context),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 23.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 23.w, vertical: 10.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: chat.name == "Ash Stokes"
                                    ? Color(0xffE6F3FF)
                                    : Colors.transparent),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 25.r,
                                  backgroundColor: Pallets.primary100,
                                ),
                                SizedBox(width: 13.w),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                          text: chat.name ?? '',
                                          fontWeight: FontWeight.w700,
                                          maxLines: 1,
                                          fontSize: 18,
                                          textOverflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left),
                                      SizedBox(height: 2.h),
                                      TextView(
                                          text: chat.message ?? '',
                                          fontWeight: FontWeight.w400,
                                          maxLines: 1,
                                          color: Pallets.grey,
                                          textOverflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 13.w),
                                Visibility(
                                  visible: chat.thereIsMessage!,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      TextView(
                                          text: chat.time ?? '',
                                          fontWeight: FontWeight.w400,
                                          maxLines: 1,
                                          textOverflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.right),
                                      SizedBox(height: 2.h),
                                      CircleAvatar(
                                        radius: 10.r,
                                        backgroundColor: Pallets.primary100,
                                        child: TextView(
                                            text: '5',
                                            fontWeight: FontWeight.w400,
                                            maxLines: 1,
                                            fontSize: 12,
                                            color: Pallets.white,
                                            textOverflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList()
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class ChatModel {
  final String? name;
  final String? message;
  final bool? thereIsMessage;
  final String? time;
  final bool? isOnline;

  ChatModel(
      {this.name, this.message, this.thereIsMessage, this.time, this.isOnline});

  static List<ChatModel> getChatsList() {
    List<ChatModel> _contacts = [];
    ChatModel _contactModel = ChatModel(
        name: 'Ash Stokes',
        message: 'Please can you check the images',
        thereIsMessage: true,
        isOnline: true,
        time: '10:21');
    _contacts.add(_contactModel);

    _contactModel = ChatModel(
        name: 'Gover Ward',
        message:
            'Let’s redesign that landing page, i’m thinking of some ......',
        thereIsMessage: false,
        isOnline: false,
        time: '06:21');
    _contacts.add(_contactModel);

    _contactModel = ChatModel(
        name: 'Gover Ward',
        message:
            'Let’s redesign that landing page, i’m thinking of some ......',
        thereIsMessage: false,
        isOnline: false,
        time: '06:21');
    _contacts.add(_contactModel);
    _contactModel = ChatModel(
        name: 'Gover Ward',
        message:
            'Let’s redesign that landing page, i’m thinking of some ......',
        thereIsMessage: false,
        isOnline: false,
        time: '06:21');
    _contacts.add(_contactModel);

    _contactModel = ChatModel(
        name: 'Gover Ward',
        message:
            'Let’s redesign that landing page, i’m thinking of some ......',
        thereIsMessage: false,
        isOnline: false,
        time: '06:21');
    _contacts.add(_contactModel);

    return _contacts;
  }
}
