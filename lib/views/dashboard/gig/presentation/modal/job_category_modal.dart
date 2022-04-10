import 'package:client/core/entity/skills/skill.dart';
import 'package:client/core/enums/viewstate.dart';
import 'package:client/core/helper/helper_handler.dart';
import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/views/dashboard/gig/data/model/category_of_gig_response/datum.dart';
import 'package:client/views/dashboard/gig/domain/source/local/gig_category.dart';
import 'package:client/views/dashboard/gig/presentation/provider/gig_provider.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/search_field.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class JobCategoryModal extends StatefulWidget {
  final Function(Datum? datum)? callBack;

  JobCategoryModal({Key? key, this.callBack}) : super(key: key);

  @override
  _JobCategoryModalState createState() => _JobCategoryModalState();
}

class _JobCategoryModalState extends State<JobCategoryModal> {
  GigProvider? _provider;
  String _search = '';
  @override
  void initState() {
    _provider = Provider.of<GigProvider>(context, listen: false);
    _provider?.jobCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Utils.getDeviceHeight(context) * .8,
      child: Scaffold(
        appBar: defaultAppBar(context,
            title: 'Job Categories', centerTitle: true, showClearButton: false),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 23.h),
              SearchAndFilter(
                  showFilter: false,
                  hint: 'Search for job category',
                  onChanged: (value) {
                    setState(() => _search = value);
                  }),
              SizedBox(height: 11.h),
              ValueListenableBuilder(
                  valueListenable: categoryDao!.getListenable()!,
                  builder: (_, Box<dynamic> box, __) {
                    final _categoryList = categoryDao!
                        .getConvertedData(categoryDao!.box!)
                        .toList();
                    return Consumer<GigProvider>(
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
                                  ..._categoryList
                                      .map(
                                        (element) => element.name!
                                                .toLowerCase()
                                                .contains(_search.toLowerCase())
                                            ? ListTile(
                                                contentPadding: EdgeInsets.zero,
                                                onTap: () {
                                                  widget.callBack!(element);
                                                  PageRouter.goBack(context);
                                                },
                                                title: TextView(
                                                  text: element.name ?? '',
                                                  textAlign: TextAlign.left,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16.sp,
                                                ),
                                              )
                                            : Container(),
                                      )
                                      .toList()
                                ]),
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
}
