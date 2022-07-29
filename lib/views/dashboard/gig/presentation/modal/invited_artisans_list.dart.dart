import 'package:client/core/enums/viewstate.dart';
import 'package:client/core/helper/helper_handler.dart';
import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/search_field.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/entity/datum/datum.model.dart';
import '../../../../../core/entity/user/user.dart';
import '../../../../../core/helper/utils/pallets.dart';
import '../../../../widgets/buttons.dart';
import '../../../../widgets/image_loader.dart';
import '../../domain/source/local/list_of_artisans_dao.dart';
import '../provider/artisan_provider.dart';

// ignore: must_be_immutable
class InviteArtisansModal extends StatefulWidget {
  final Function(List<User>? datum)? callBack;
  List<User>? list = [];

  InviteArtisansModal({Key? key, this.list, this.callBack}) : super(key: key);

  @override
  _InviteArtisansModalState createState() => _InviteArtisansModalState();
}

class _InviteArtisansModalState extends State<InviteArtisansModal> {
  ArtisanProvider? _provider;
  String _search = '';
  List<User> _tempList = [];

  @override
  void initState() {
    _provider = Provider.of<ArtisanProvider>(context, listen: false);
    _provider?.listOfArtisan();
    _resetListIfAny();
    super.initState();
  }

  void _resetListIfAny() {
    widget.list?.map((e) {
      _ids.add(e.id!);
      _tempList.add(e);
    }).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Utils.getDeviceHeight(context) * .8,
      child: Scaffold(
        appBar: defaultAppBar(context,
            title: 'Artisans', centerTitle: true, showClearButton: false),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 23.h),
              SearchAndFilter(
                  showFilter: false,
                  hint: 'Search for artisan',
                  onChanged: (value) {
                    setState(() => _search = value);
                  }),
              SizedBox(height: 11.h),
              ValueListenableBuilder(
                  valueListenable:
                      listOfArtisansDao!.getListenableWithoutFuture()!,
                  builder: (_, Box<dynamic> box, __) {
                    final _artisans = listOfArtisansDao!
                        .getConvertedData(listOfArtisansDao!.box!)
                        .toList();

                    return Consumer<ArtisanProvider>(
                        builder: (context, provider, child) {
                      return Expanded(
                        child: SafeArea(
                          child: Stack(
                            children: [
                              Container(
                                height: Utils.getDeviceHeight(context),
                                margin: EdgeInsets.only(bottom: 50.h),
                                child: ListView(shrinkWrap: true, children: [
                                  Visibility(
                                      visible: provider.state == ViewState.busy,
                                      child: LinearProgressIndicator()),
                                  ..._artisans
                                      .map(
                                        (element) => element.user == null
                                            ? Container()
                                            : _getName(element)!
                                                ? ListTile(
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    onTap: () {
                                                      _addItem(element.user!);
                                                    },
                                                    leading: CircularImage(
                                                      path: element
                                                              .user!.avatar ??
                                                          '',
                                                      radius: 22,
                                                    ),
                                                    title: TextView(
                                                      text:
                                                          '${element.user?.firstName ?? ''} ${element.user?.lastName ?? ''}',
                                                      textAlign: TextAlign.left,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16.sp,
                                                    ),
                                                    subtitle: TextView(
                                                      text:
                                                          '${element.user?.email ?? ''}',
                                                      textAlign: TextAlign.left,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 12.sp,
                                                    ),
                                                    trailing: _isSelected(
                                                            element.user!)
                                                        ? Icon(
                                                            Icons
                                                                .radio_button_checked_outlined,
                                                            color: Pallets
                                                                .primary100,
                                                          )
                                                        : Icon(
                                                            Icons
                                                                .radio_button_off_outlined,
                                                            color: Pallets
                                                                .primary100,
                                                          ),
                                                  )
                                                : Container(),
                                      )
                                      .toList(),
                                  SizedBox(height: 23.h),
                                ]),
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                margin: EdgeInsets.only(bottom: 16.h),
                                child: ButtonWidget(
                                  buttonText: 'Next',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  onPressed: () {
                                    widget.callBack!(_tempList);
                                    PageRouter.goBack(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }

  bool? _getName(Datum element) =>
      element.user!.firstName!.toLowerCase().contains(_search.toLowerCase()) ||
      element.user!.lastName!.toLowerCase().contains(_search.toLowerCase());

  List<int> _ids = [];

  bool _isSelected(User d) {
    return _ids.contains(d.id);
  }

  void _addItem(User d) {
    if (_isSelected(d)) {
      _tempList.remove(d);
      _ids.remove(d.id);
    } else {
      _tempList.add(d);
      _ids.add(d.id!);
    }
    setState(() {});
  }
}
