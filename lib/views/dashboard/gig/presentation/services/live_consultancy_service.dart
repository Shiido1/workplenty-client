// ignore_for_file: must_be_immutable, unused_field

import 'package:client/core/enums/payment_type.dart';
import 'package:client/core/helper/helper_handler.dart';
import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/date_picker.dart';
import 'package:client/core/helper/utils/images.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/core/helper/utils/validators.dart';
import 'package:client/views/dashboard/gig/presentation/widget/row_container_widget.dart';
import 'package:client/views/widgets/body_widget.dart';
import 'package:client/views/widgets/buttons.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/edit_form_widget.dart';
import 'package:client/views/widgets/image_loader.dart';
import 'package:client/views/widgets/review_bg_card.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/entity/skills/skill.dart';
import '../../../../../core/entity/user/user.dart';
import '../../../../widgets/bottom_sheet.dart';
import '../modal/invited_artisans_list.dart.dart';
import '../modal/job_category_modal.dart';
import '../provider/artisan_provider.dart';
import 'freelance/widgets/first.dart';
import 'freelance/widgets/second.dart';

class LiveConsultancy extends StatefulWidget {
  LiveConsultancy({Key? key}) : super(key: key);

  @override
  State<LiveConsultancy> createState() => _LiveConsultancyState();
}

class _LiveConsultancyState extends State<LiveConsultancy> {
  final TextEditingController privateMessageController =
      TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController _jobCategoryController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();

  PaymentType _paymentType = PaymentType.cash;
  List<Skill>? _skillList = [];
  int? _experienceIndex;
  List<int> _artisansId = [];
  List<String> _selectedSkills = [];
  List<User> _artisans = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: defaultAppBar2(context,
            leadingWidget: IconButton(
              color: Pallets.white,
              icon: Icon(Icons.clear),
              onPressed: () => PageRouter.goBack(context),
            ),
            textColor: Pallets.white,
            title: 'Live Consultancy',
            centerTitle: true),
        body: BodyWidget(
          child: ListView(children: [
            SizedBox(
              height: 10.h,
            ),
            First(),
            SizedBox(height: 23.h),
            SecondBadgeWidget(
              privateMessageController: privateMessageController,
              titleController: titleController,
              descriptionController: descriptionController,
              title: 'Live Consultancy Title',
              description: 'Describe your live consultancy details',
            ),
            SizedBox(
              height: 20.h,
            ),
            ReviewBgCard(Column(
              children: [
                RowContainer(
                    image: AppImages.brief_case, text: 'Session Category'),
                EditFormField(
                  label: 'Web Development',
                  suffixWidget: ImageLoader(path: AppImages.vector),
                  readOnly: true,
                  controller: _jobCategoryController,
                  validator: Validators.validateString(),
                  onTapped: () {
                    BottomSheets.showSheet<String>(
                      context,
                      child: JobCategoryModal(callBack: (data) {
                        _jobCategoryController.text = data?.name ?? '';
                        setState(() {});
                      }),
                    );
                  },
                ),
              ],
            )),
            SizedBox(
              height: 40.h,
            ),
            ReviewBgCard(Column(
              children: [
                RowContainer(
                    image: AppImages.calender, text: 'Session Date & Time'),
                EditFormField(
                  suffixWidget: ImageLoader(path: AppImages.vector),
                  label: 'From',
                  readOnly: true,
                  controller: _fromDateController,
                  validator: Validators.validateString(),
                  onTapped: () => pickDate(
                      context: context,
                      dateOptions: DateOptions.future,
                      showTime: true,
                      onChange: (d) {
                        _fromDateController.text = d;
                        setState(() {});
                      }),
                ),
              ],
            )),
            SizedBox(
              height: 20.h,
            ),
            ReviewBgCard(
              Column(
                children: [
                  RowContainer(
                      image: AppImages.emptyWallet, text: 'Budget per hour'),
                  EditFormField(
                    label: 'NGN',
                    controller: _budgetController,
                    validator: Validators.validateInt(),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            SizedBox(height: 23.h),
            ReviewBgCard(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: RowContainer(
                              image: AppImages.arrange,
                              text: 'Invite Artisan')),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            BottomSheets.showSheet<String>(
                              context,
                              child: InviteArtisansModal(callBack: (l) {
                                _artisans = l ?? [];
                                setState(() {});
                              }),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextView(
                                text: 'Invite',
                                maxLines: 1,
                                fontWeight: FontWeight.w700,
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(width: 10.w),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(color: Pallets.grey)),
                                child: Icon(
                                  Icons.add,
                                  size: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ButtonWidget(
              buttonText: 'Start Session & Invite Artisan',
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              onPressed: () {},
              width: Utils.getDeviceWidth(context),
            ),
            SizedBox(
              height: 40,
            ),
          ]),
        ));
  }

  tap(String value) => Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: Pallets.primary100),
        child: TextView(
            color: Pallets.white,
            text: value,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center),
      );
}
