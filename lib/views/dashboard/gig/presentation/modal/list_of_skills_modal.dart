import 'package:client/core/enums/viewstate.dart';
import 'package:client/core/helper/helper_handler.dart';
import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/dashboard/gig/data/model/list_of_skills_response/datum.dart';
import 'package:client/views/dashboard/gig/domain/source/local/skill_dao.dart';
import 'package:client/views/dashboard/gig/presentation/provider/gig_provider.dart';
import 'package:client/views/widgets/buttons.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/search_field.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SkillsModal extends StatefulWidget {
  final Function(List<Datum> list)? callBack;
  List<Datum>? list = [];

  SkillsModal({Key? key, this.list, this.callBack}) : super(key: key);

  @override
  _SkillsModalState createState() => _SkillsModalState();
}

class _SkillsModalState extends State<SkillsModal> {
  GigProvider? _provider;

  List<Datum> _tempList = [];

  String _search = '';
  @override
  void initState() {
    _provider = Provider.of<GigProvider>(context, listen: false);
    _provider?.getListOfSkills();
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
            title: 'List of Skills', centerTitle: true, showClearButton: false),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 23.h),
              SearchAndFilter(
                  showFilter: false,
                  hint: 'Search for a skill and add...',
                  onChanged: (value) {
                    setState(() => _search = value);
                  }),
              SizedBox(height: 11.h),
              ValueListenableBuilder(
                  valueListenable: skillDao!.getListenable()!,
                  builder: (_, Box<dynamic> box, __) {
                    final _skillList =
                        skillDao!.getConvertedData(skillDao!.box!).toList();
                    return Consumer<GigProvider>(
                        builder: (context, provider, child) {
                      if (provider.state == ViewState.busy) {
                        return const Center(
                            child: TextView(text: 'Fetching gigs...'));
                      }

                      return Expanded(
                        child: SafeArea(
                          child: Stack(
                            children: [
                              Container(
                                height: Utils.getDeviceHeight(context),
                                margin: EdgeInsets.only(bottom: 50.h),
                                child: ListView(
                                    shrinkWrap: true,
                                    children: _skillList
                                        .map(
                                          (element) => element.name!
                                                  .toLowerCase()
                                                  .contains(
                                                      _search.toLowerCase())
                                              ? ListTile(
                                                  onTap: () {
                                                    _addItem(element);
                                                  },
                                                  title: TextView(
                                                    text: element.name ?? '',
                                                    textAlign: TextAlign.left,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.sp,
                                                  ),
                                                  trailing: _isSelected(element)
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
                                        .toList()),
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: ButtonWidget(
                                  buttonText: 'Next',
                                  fontSize: 18.sp,
                                  width: Utils.getDeviceWidth(context),
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

  List<int> _ids = [];

  bool _isSelected(Datum d) {
    return _ids.contains(d.id);
  }

  void _addItem(Datum d) {
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
