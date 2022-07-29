import 'dart:io';

import 'package:client/core/di/injector.dart';
import 'package:client/core/entity/skills/skill.dart';
import 'package:client/core/entity/user/user.dart';
import 'package:client/core/enums/gig_type.dart';
import 'package:client/core/enums/payment_type.dart';
import 'package:client/core/enums/project_type.dart';
import 'package:client/core/helper/configs/instances.dart';
import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/image_picker.dart';
import 'package:client/core/helper/utils/images.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/core/helper/utils/validators.dart';
import 'package:client/core/helper/utils/workplenty_dialog.dart';
import 'package:client/views/dashboard/gig/domain/entity/gig/gig_entity.dart';
import 'package:client/views/dashboard/gig/presentation/modal/experience_level_modal.dart';
import 'package:client/views/dashboard/gig/presentation/modal/invited_artisans_list.dart.dart';
import 'package:client/views/dashboard/gig/presentation/modal/job_category_modal.dart';
import 'package:client/views/dashboard/gig/presentation/modal/list_of_skills_modal.dart';
import 'package:client/views/dashboard/gig/presentation/modal/timeline_modal.dart';
import 'package:client/views/dashboard/gig/presentation/provider/artisan_provider.dart';
import 'package:client/views/dashboard/gig/presentation/services/freelance/widgets/third.dart';
import 'package:client/views/dashboard/gig/presentation/services/model/checkbox_model.dart';
import 'package:client/views/dashboard/gig/presentation/widget/row_container_widget.dart';
import 'package:client/views/widgets/body_widget.dart';
import 'package:client/views/widgets/bottom_sheet.dart';
import 'package:client/views/widgets/buttons.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/edit_form_widget.dart';
import 'package:client/views/widgets/image_loader.dart';
import 'package:client/views/widgets/review_bg_card.dart';
import 'package:client/views/widgets/skill_widget.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/helper/utils/file_picker.dart';
import '../bloc/servicebloc_bloc.dart';
import '../widgets/add_skill_widget.dart';
import '../widgets/button_widget.dart';
import 'model/milestone.dart';
import 'widgets/first.dart';
import 'widgets/second.dart';

// ignore: must_be_immutable
class FreeLanceJobService extends StatefulWidget {
  FreeLanceJobService({Key? key}) : super(key: key);

  @override
  State<FreeLanceJobService> createState() => _FreeLanceJobServiceState();
}

class _FreeLanceJobServiceState extends State<FreeLanceJobService> {
  final _loadingKey = GlobalKey<FormState>();
  final _globalFormKey = GlobalKey<FormState>();
  final _bloc = ServiceblocBloc(inject());

  List<Skill>? _skillList = [];

  final _image = ImagePickerHandler();
  List<User> _artisans = [];

  int _checkboxIndex = 0;
  int? _experienceIndex;

  ProjectType _projectType = ProjectType.Milestone;

  final TextEditingController privateMessageController =
      TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController _jobCategoryController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  List<MilestoneModel> _miles = [];

  @override
  void initState() {
    Provider.of<ArtisanProvider>(context, listen: false).listOfArtisan();
    super.initState();
  }

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
            centerTitle: true,
            title: 'Freelance Job'),
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
                }
                if (state is ServiceblocFailed) {
                  WorkPlenty.hideLoading(_loadingKey);
                  WorkPlenty.error(state.message);
                }
              },
              child: Consumer<ArtisanProvider>(
                builder: (context, value, child) {
                  return SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          First(),
                          SizedBox(height: 23.h),
                          SecondBadgeWidget(
                            privateMessageController: privateMessageController,
                            titleController: titleController,
                            descriptionController: descriptionController,
                            title: 'Project Title',
                            description:
                                'Describe your project and other specific details',
                          ),
                          ReviewBgCard(
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RowContainer(
                                    image: AppImages.paper_clip,
                                    text: 'Attachment'),
                                SizedBox(height: 10.h),
                                EditFormField(
                                  label: 'Add Attachment',
                                  readOnly: true,
                                  onTapped: () => _pickFiles(),
                                ),
                                ..._files
                                    .map((f) => Row(
                                          children: [
                                            Expanded(
                                              child: TextView(
                                                  text: f.filename ?? '',
                                                  color: Pallets.grey),
                                            ),
                                            IconButton(
                                                padding: EdgeInsets.zero,
                                                onPressed: () {
                                                  _files.remove(f);
                                                  setState(() {});
                                                },
                                                icon: Icon(Icons.clear))
                                          ],
                                        ))
                                    .toList()
                              ],
                            ),
                            borderRadiusGeometry: BorderRadius.zero,
                            vertical: 25.33,
                          ),
                          SizedBox(height: 23.h),
                          ReviewBgCard(
                            Column(
                              children: [
                                RowContainer(
                                    image: AppImages.brief_case,
                                    text: 'Job Category'),
                                SizedBox(height: 10.h),
                                EditFormField(
                                  label: 'Web Development',
                                  suffixWidget:
                                      ImageLoader(path: AppImages.vector),
                                  readOnly: true,
                                  controller: _jobCategoryController,
                                  validator: Validators.validateString(),
                                  onTapped: () {
                                    BottomSheets.showSheet<String>(
                                      context,
                                      child: JobCategoryModal(callBack: (data) {
                                        _jobCategoryController.text =
                                            data?.name ?? '';
                                        setState(() {});
                                      }),
                                    );
                                  },
                                ),
                              ],
                            ),
                            borderRadiusGeometry: BorderRadius.zero,
                            vertical: 25.33,
                          ),
                          SizedBox(height: 23.h),
                          ReviewBgCard(
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RowContainer(
                                    image: AppImages.document,
                                    text: 'Cover Letter'),
                                SizedBox(height: 4.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                    CheckBoxModel.getCovers().length,
                                    (index) => GestureDetector(
                                        onTap: () => setState(
                                            () => _checkboxIndex = index),
                                        child: Row(
                                          children: [
                                            Icon(_checkboxIndex == index
                                                ? Icons.check_box
                                                : Icons
                                                    .check_box_outline_blank),
                                            SizedBox(width: 8.w),
                                            TextView(
                                              text: CheckBoxModel.getCovers()[
                                                          index]
                                                      .title ??
                                                  '',
                                              fontWeight: FontWeight.w500,
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        )),
                                  ).toList(),
                                ),
                              ],
                            ),
                            borderRadiusGeometry: BorderRadius.zero,
                            vertical: 25.33,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
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
                                          .map((element) =>
                                              SkillsWidget(element))
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
                          SizedBox(height: 23.h),
                          ReviewBgCard(
                            Column(
                              children: [
                                RowContainer(
                                    image: AppImages.wallet,
                                    text: 'Project Type'),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    ButtonW(
                                        title: 'Milestone',
                                        defaultProjectType:
                                            ProjectType.Milestone,
                                        projectType: _projectType,
                                        onTap: () => setState(() =>
                                            _projectType =
                                                ProjectType.Milestone)),
                                    SizedBox(width: 10.w),
                                    ButtonW(
                                        title: 'Project Completion',
                                        defaultProjectType:
                                            ProjectType.Project_Completion,
                                        projectType: _projectType,
                                        onTap: () => setState(() =>
                                            _projectType = ProjectType
                                                .Project_Completion)),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.w,
                                ),
                              ],
                            ),
                          ),
                          Third(
                            projectType: _projectType,
                            list: (miles, val) {
                              _miles = miles;
                              if (val!) setState(() {});
                            },
                          ),
                          SizedBox(height: 23.h),
                          ReviewBgCard(
                            Column(
                              children: [
                                RowContainer(
                                    image: AppImages.crown,
                                    text: 'Experience Level'),
                                SizedBox(height: 10.h),
                                EditFormField(
                                  label: 'Intermediate',
                                  suffixWidget:
                                      ImageLoader(path: AppImages.vector),
                                  readOnly: true,
                                  validator: Validators.validateString(),
                                  controller: _experienceController,
                                  onTapped: () {
                                    BottomSheets.showSheet<String>(
                                      context,
                                      child: ExperienceLevelModal(
                                          onTap: (ExperienceLevel? l) {
                                        _experienceController.text =
                                            l!.title ?? '';
                                        _experienceIndex = l.value!;
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
                              children: [
                                RowContainer(
                                    image: AppImages.emptyWallet,
                                    text: 'Budget'),
                                SizedBox(height: 10.h),
                                EditFormField(
                                  label: 'NGN',
                                  validator: Validators.validateInt(),
                                  controller: _budgetController,
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(height: 23.h),
                                RowContainer(
                                    image: AppImages.clock, text: 'Timeline'),
                                EditFormField(
                                  label: '1 Week',
                                  suffixWidget:
                                      ImageLoader(path: AppImages.vector),
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
                          SizedBox(height: 50.h),
                          ReviewBgCard(
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                            child: InviteArtisansModal(
                                                callBack: (l) {
                                              _artisans = l ?? [];
                                              setState(() {});
                                            }),
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
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
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                  border: Border.all(
                                                      color: Pallets.grey)),
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
                                                  _files.remove(user);
                                                  setState(() {});
                                                },
                                                icon: Icon(Icons.clear))
                                          ],
                                        )))
                                    .toList()
                              ],
                            ),
                          ),
                          SizedBox(height: 23.h),
                          ButtonWidget(
                            buttonText: 'Post Freelance Job & Invite',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            onPressed: () => _proceed(value),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ]),
                  );
                },
              ),
            ),
          ),
        ));
  }

  List<int> _artisansId = [];
  List<String> _selectedSkills = [];

  void _proceed(ArtisanProvider artisanProvider) {
    if (_validate()) {
      _bloc.add(ServiceEvent(GigEntity(
          // id: '${artisanProvider.datum?.id}',
          id: '2',
          // industryId: '${artisanProvider.datum?.industry?.id}',
          industryId: '1',
          type: GigType.FREELANCE,
          privateMessage: privateMessageController.text,
          title: titleController.text,
          description: descriptionController.text,
          timeline: _timeController.text,
          paymentType: PaymentType.cash,
          isPublished: '1',
          experienceLevel: '$_experienceIndex',
          coverLetterRequired: '$_checkboxIndex',
          totalBudget: _budgetController.text,
          skill: _selectedSkills,
          attachments: _files,
          // invited_artisan_ids: _artisansId,
          invited_artisan_ids: [2],
          milestones: _miles,
          projectType: _projectType)));
    }
    print('object file$_files');
  }

  bool _validate() {
    if (!_globalFormKey.currentState!.validate()) {
      return false;
    }

    if (_files.isEmpty) {
      WorkPlenty.error('Please select a file');
      return false;
    }

    if (_skillList!.isEmpty) {
      WorkPlenty.error('Please select at least one skill');
      return false;
    }
    // if (_artisans.isEmpty) {
    //   WorkPlenty.error('Please select at least one artisan');
    //   return false;
    // }

    _skillList!.map((e) => _selectedSkills.add(e.name!)).toList();
    // _artisans.map((e) => _artisansId.add(e.id!)).toList();
    setState(() {});
    return true;
  }

  List<MultipartFile> _files = [];

  void _pickFiles() async {
    try {
      List<String?> _f = await WorkplentyFilePicker.returnPickedFiles();
      _files = _f.map((path) => MultipartFile.fromFileSync(path!)).toList();
      setState(() {});
    } catch (e) {
      logger.e(e);
    }
  }
}
