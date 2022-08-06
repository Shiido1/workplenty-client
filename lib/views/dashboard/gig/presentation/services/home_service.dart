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
import 'package:client/views/widgets/custom_checkbox.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/edit_form_widget.dart';
import 'package:client/views/widgets/image_loader.dart';
import 'package:client/views/widgets/review_bg_card.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/di/injector.dart';
import '../../../../../core/entity/skills/skill.dart';
import '../../../../../core/entity/user/user.dart';
import '../../../../../core/enums/export_enums.dart';
import '../../../../../core/enums/gig_type.dart';
import '../../../../../core/helper/utils/workplenty_dialog.dart';
import '../../../../widgets/bottom_sheet.dart';
import '../../../../widgets/skill_widget.dart';
import '../../domain/entity/gig/gig_entity.dart';
import '../modal/experience_level_modal.dart';
import '../modal/invited_artisans_list.dart.dart';
import '../modal/job_category_modal.dart';
import '../modal/list_of_skills_modal.dart';
import '../modal/timeline_modal.dart';
import '../provider/artisan_provider.dart';
import 'bloc/servicebloc_bloc.dart';
import 'freelance/model/milestone.dart';
import 'freelance/widgets/first.dart';
import 'freelance/widgets/second.dart';
import 'freelance/widgets/third.dart';
import 'widgets/add_skill_widget.dart';

class HomeService extends StatefulWidget {
  final bool? isInvite;
  HomeService({this.isInvite = true, Key? key}) : super(key: key);

  @override
  State<HomeService> createState() => _HomeServiceState();
}

class _HomeServiceState extends State<HomeService> {
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
  final _loadingKey = GlobalKey<FormState>();
  final _globalFormKey = GlobalKey<FormState>();
  final _bloc = ServiceblocBloc(inject());
  int? _industryId;
  ProjectType _projectType = ProjectType.Project_Completion;
  List<MilestoneModel> _miles = [];

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
            title: 'Home Service',
            centerTitle: true),
        body: Form(
          key: _globalFormKey,
          child: BodyWidget(
              child: BlocListener<ServiceblocBloc, ServiceblocState>(
            bloc: _bloc,
            listener: (context, state) {
              if (state is ServiceblocLoading) {
                WorkPlenty.showLoading(context, _loadingKey, '');
              }
              if (state is ServiceblocSuccess) {
                WorkPlenty.hideLoading(_loadingKey);
                WorkPlenty.success(state.response?.msg ?? '');
                PageRouter.goBack(context);
              }
              if (state is ServiceblocFailed) {
                WorkPlenty.hideLoading(_loadingKey);
                WorkPlenty.error(state.message);
              }
            },
            child: Consumer<ArtisanProvider>(
              builder: (context, value, child) {
                return ListView(children: [
                  if (widget.isInvite!) SizedBox(height: 10.h),
                  if (widget.isInvite!) First(),
                  if (widget.isInvite!) SizedBox(height: 23.h),
                  SecondBadgeWidget(
                    isInvite: widget.isInvite!,
                    privateMessageController: privateMessageController,
                    titleController: titleController,
                    descriptionController: descriptionController,
                    title: 'Project Title',
                    description:
                        'Describe your project and other specific details',
                  ),
                  ReviewBgCard(Column(
                    children: [
                      RowContainer(
                          image: AppImages.location,
                          text: 'Address for Home Service'),
                      EditFormField(
                        label:
                            'e.g. Hello World, Silicon Valley, Lagos, Nigeria',
                        validator: Validators.validateString(),
                        controller: _addressController,
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  )),
                  SizedBox(
                    height: 20.h,
                  ),
                  ReviewBgCard(Column(
                    children: [
                      RowContainer(
                          image: AppImages.brief_case, text: 'Job Category'),
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
                              _industryId = data?.categoryId;
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
                          image: AppImages.calender, text: 'Home Service Date'),
                      EditFormField(
                        suffixWidget: ImageLoader(path: AppImages.vector),
                        label: 'Home Service Date',
                        readOnly: true,
                        controller: _fromDateController,
                        validator: Validators.validateString(),
                        onTapped: () => pickDate(
                            context: context,
                            dateOptions: DateOptions.future,
                            onChange: (d) {
                              _fromDateController.text = d;
                              setState(() {});
                            }),
                      ),
                    ],
                  )),
                  SizedBox(height: 20.h),
                  Third(
                    projectType: _projectType,
                    list: (miles, val) {
                      _miles = miles;
                      if (val!) setState(() {});
                    },
                  ),
                  ReviewBgCard(
                    Column(
                      children: [
                        RowContainer(
                            image: AppImages.card, text: 'Payment Type'),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomCheckBox(
                                defaultValue: PaymentType.cash,
                                receivingValue: _paymentType,
                                title: 'Cash',
                                onTap: () {
                                  _paymentType = PaymentType.cash;
                                  setState(() {});
                                },
                              ),
                            ),
                            Expanded(
                              child: CustomCheckBox(
                                defaultValue: PaymentType.card,
                                receivingValue: _paymentType,
                                title: 'Card',
                                onTap: () {
                                  _paymentType = PaymentType.card;
                                  setState(() {});
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ReviewBgCard(Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RowContainer(image: AppImages.cup, text: 'Skill'),
                      SizedBox(
                        height: 20.h,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Wrap(
                              spacing: 5,
                              runSpacing: 10,
                              children: _skillList!
                                  .map((element) => SkillsWidget(element))
                                  .toList(),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            AddSkillWidget(
                                value: '+',
                                onTap: () {
                                  BottomSheets.showSheet<String>(
                                    context,
                                    child: SkillsModal(
                                        list: _skillList,
                                        callBack: (List<Skill> l) {
                                          _skillList = l;
                                          setState(() {});
                                        }),
                                  );
                                })
                          ],
                        ),
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
                            image: AppImages.crown, text: 'Experience Level'),
                        SizedBox(height: 10.h),
                        EditFormField(
                          label: 'Intermediate',
                          suffixWidget: ImageLoader(path: AppImages.vector),
                          readOnly: true,
                          validator: Validators.validateString(),
                          controller: _experienceController,
                          onTapped: () {
                            BottomSheets.showSheet<String>(
                              context,
                              child: ExperienceLevelModal(
                                  onTap: (ExperienceLevel? l) {
                                _experienceController.text = l!.title ?? '';
                                _experienceIndex = l.value!;
                                setState(() {});
                              }),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ReviewBgCard(
                    Column(
                      children: [
                        RowContainer(
                            image: AppImages.emptyWallet,
                            text: 'Budget per hour'),
                        EditFormField(
                          label: 'NGN',
                          controller: _budgetController,
                          validator: Validators.validateInt(),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        RowContainer(
                            image: AppImages.clock,
                            text: 'Home Service Duration'),
                        EditFormField(
                          label: '1 Week',
                          suffixWidget: ImageLoader(path: AppImages.vector),
                          readOnly: true,
                          controller: _timeController,
                          validator: Validators.validateString(),
                          onTapped: () {
                            BottomSheets.showSheet<String>(
                              context,
                              child: TimelineModal(onTap: (String? l) {
                                _timeController.text = l ?? '';
                                setState(() {});
                              }),
                            );
                          },
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          border:
                                              Border.all(color: Pallets.grey)),
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
                        SizedBox(height: 13.h),
                        ..._artisans
                            .map(((user) => Row(
                                  children: [
                                    Expanded(
                                      child: TextView(
                                          text:
                                              '${user.firstName ?? ''} ${user.lastName ?? ''}  ',
                                          color: Pallets.grey),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          _artisans.remove(user);
                                          setState(() {});
                                        },
                                        icon: Icon(Icons.clear))
                                  ],
                                )))
                            .toList()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ButtonWidget(
                    buttonText: 'Post Home Service & Invite',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    onPressed: () => _proceed(value),
                    width: Utils.getDeviceWidth(context),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ]);
              },
            ),
          )),
        ));
  }

  void _proceed(ArtisanProvider artisanProvider) {
    if (_validate()) {
      _bloc.add(ServiceEvent(GigEntity(
          industryId: _industryId?.toString(),
          type: GigType.HOME_SERVICE,
          title: titleController.text,
          description: descriptionController.text,
          serviceAddress: _addressController.text,
          paymentType: _paymentType,
          serviceDate: _fromDateController.text,
          experienceLevel: '$_experienceIndex',
          hourlyBudget: _budgetController.text,
          skill: _selectedSkills,
          isPublished: "1",
          milestones: _miles,
          projectType: _projectType,
          invited_artisan_ids: _artisansId,
          serviceDuration: _timeController.text)));
    }
  }

  bool _validate() {
    if (!_globalFormKey.currentState!.validate()) {
      return false;
    }

    if (_skillList!.isEmpty) {
      WorkPlenty.error('Please select at least one skill');
      return false;
    }

    _skillList!.map((e) => _selectedSkills.add(e.name!)).toList();
    if (_artisans.isNotEmpty) {
      _artisans.map((e) => _artisansId.add(e.id!)).toList();
    }
    setState(() {});
    return true;
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
