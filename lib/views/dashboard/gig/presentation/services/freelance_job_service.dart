import 'dart:io';

import 'package:client/core/di/injector.dart';
import 'package:client/core/enums/gig_type.dart';
import 'package:client/core/helper/configs/instances.dart';
import 'package:client/core/helper/helper_handler.dart';
import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/image_picker.dart';
import 'package:client/core/helper/utils/images.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/core/helper/utils/workplenty_dialog.dart';
import 'package:client/views/dashboard/gig/data/model/list_of_skills_response/datum.dart';
import 'package:client/views/dashboard/gig/domain/entity/gig/gig_entity.dart';
import 'package:client/views/dashboard/gig/presentation/modal/list_of_skills_modal.dart';
import 'package:client/views/dashboard/gig/presentation/provider/artisan_provider.dart';
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

import 'bloc/servicebloc_bloc.dart';

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

  List<Datum>? _skillList = [];

  final _image = ImagePickerHandler();
  // File? _file;
  List<File> _fileList = [];

  TextEditingController privateMessageController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
            title: 'Freelance Job'),
        body: BodyWidget(
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
            child: Form(
              key: _globalFormKey,
              child: ListView(children: [
                Consumer<ArtisanProvider>(
                  builder: ((context, value, child) => ReviewBgCard(
                      Row(mainAxisSize: MainAxisSize.min, children: [
                        CircularImage(
                          path: value.artisan?.avatar ?? '',
                          radius: 22,
                        ),
                        SizedBox(
                          width: 13.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text:
                                  '${value.artisan?.firstName ?? ''} ${value.artisan?.lastName}',
                              maxLines: 1,
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              textAlign: TextAlign.left,
                            ),
                            TextView(
                              text: 'Technical Writer',
                              maxLines: 1,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )
                      ]),
                      borderRadiusGeometry: BorderRadius.zero,
                      vertical: 25.33)),
                ),
                SizedBox(height: 23.h),
                ReviewBgCard(
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RowContainer(
                            image: AppImages.message,
                            text: 'Private Message to Charles Damien'),
                        SizedBox(height: 10.h),
                        EditFormField(
                          height: 150.h,
                          label: 'Type here..',
                          controller: privateMessageController,
                        ),
                        SizedBox(height: 23.h),
                        RowContainer(
                            image: AppImages.t_message, text: 'Project Title'),
                        SizedBox(height: 10.h),
                        EditFormField(
                          controller: titleController,
                        ),
                        SizedBox(height: 23.h),
                        RowContainer(
                            image: AppImages.brief_case,
                            text:
                                'Describe your project and other specific details'),
                        SizedBox(height: 10.h),
                        EditFormField(
                          height: 150.h,
                          label: 'Type here..',
                          controller: descriptionController,
                        ),
                      ],
                    ),
                    borderRadiusGeometry: BorderRadius.zero,
                    vertical: 25.33),
                SizedBox(height: 50.h),
                ReviewBgCard(
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RowContainer(
                          image: AppImages.paper_clip, text: 'Attachment'),
                      SizedBox(height: 10.h),
                      EditFormField(
                        height: 36.h,
                        label: 'Add Attachment',
                        readOnly: true,
                        onTapped: () => _pickImages(),
                      ),
                      // ButtonWidget(
                      //     height: 36.h,
                      //     radius: 8,
                      //     buttonStyle: true,
                      //     fontSize: 14,
                      //     color: Pallets.grey,
                      //     fontWeight: FontWeight.w400,
                      //     primary: Colors.transparent,
                      //     buttonText: 'Add Attachment',
                      //     onPressed: () => null),
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
                          image: AppImages.brief_case, text: 'Job Category'),
                      SizedBox(height: 10.h),
                      EditFormField(
                          label: 'Web Development',
                          suffixWidget: ImageLoader(
                            path: AppImages.vector,
                          )),
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
                          image: AppImages.document, text: 'Cover Letter'),
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  value: false, onChanged: (bool? value) {}),
                              TextView(
                                text: 'Required',
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: false, onChanged: (bool? value) {}),
                              TextView(
                                text: 'Optional',
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: false, onChanged: (bool? value) {}),
                              TextView(
                                text: 'Not Required',
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ],
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
                  children: [
                    RowContainer(image: AppImages.cup, text: 'Skill'),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Wrap(
                            spacing: 5,
                            runSpacing: 10,
                            children: _skillList!
                                .map((element) => SkillsWidget(element))
                                .toList(),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        addSkills('+', onTap: () {
                          BottomSheets.showSheet<String>(
                            context,
                            child: SkillsModal(
                                list: _skillList,
                                callBack: (List<Datum> l) {
                                  _skillList = l;
                                  setState(() {});
                                }),
                          );
                        })
                      ],
                    ),
                  ],
                )),
                SizedBox(height: 23.h),
                ReviewBgCard(
                  Column(
                    children: [
                      RowContainer(
                          image: AppImages.crown, text: 'Experience Level'),
                      SizedBox(height: 10.h),
                      EditFormField(
                          label: 'Intermediate',
                          suffixWidget: ImageLoader(
                            path: AppImages.vector,
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 23.h),
                ReviewBgCard(
                  Column(
                    children: [
                      RowContainer(
                          image: AppImages.emptyWallet, text: 'Budget'),
                      SizedBox(height: 10.h),
                      EditFormField(label: 'NGN'),
                      SizedBox(height: 23.h),
                      RowContainer(image: AppImages.clock, text: 'Timeline'),
                      EditFormField(
                        label: '1 Week',
                        suffixWidget: ImageLoader(path: AppImages.vector),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
                ReviewBgCard(
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: RowContainer(
                                  image: AppImages.arrange,
                                  text: 'Invite Artisan')),
                          Expanded(
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
                          )
                        ],
                      ),
                      SizedBox(height: 23.h),
                      TextView(text: 'Charles Damien', color: Pallets.grey),
                    ],
                  ),
                ),
                SizedBox(height: 23.h),
                ButtonWidget(
                  buttonText: 'Post Freelance Job & Invite',
                  fontSize: 18.sp,
                  width: Utils.getDeviceWidth(context),
                  fontWeight: FontWeight.w700,
                  onPressed: () => _proceed(),
                  height: 50.h,
                ),
                SizedBox(
                  height: 40,
                ),
              ]),
            ),
          ),
        ));
  }

  void _proceed() {
    // final _g = GigEntity(
    //     id: '1',
    //     industryId: '1',
    //     type: GigType.freelance,
    //     privateMessage: 'hello world',
    //     title: 'titleController.text',
    //     description: 'descriptionController.text',
    //     timeline: '2 weeks',
    //     paymentType: 'Cash',
    //     isPublished: '1',
    //     experienceLevel: '1',
    //     coverLetterRequired: '1',
    //     totalBudget: '100000',
    //     skill: ['laravel', 'flutter'],
    //     // attachments: _returListOfParsedFiles(),
    //     invited_artisan_ids: ['2', '2']);

    // logger.d(_g.saveClientsGig());

    _bloc.add(ServiceEvent(GigEntity(
        id: '1',
        industryId: '1',
        type: GigType.freelance,
        privateMessage: 'hello world',
        title: 'titleController.text',
        description: 'descriptionController.text',
        timeline: '2 weeks',
        paymentType: 'Cash',
        isPublished: '1',
        experienceLevel: '1',
        coverLetterRequired: '1',
        totalBudget: '100000',
        skill: ['laravel', 'flutter'],
        // attachments: _returListOfParsedFiles(),
        invited_artisan_ids: ['2', '2'])));
    // if (_globalFormKey.currentState!.validate()) {

    // }
  }

  // Future<FormData> _getMappedData() async {
  //   return FormData.fromMap({
  //     'id': '1',
  //     'industry_id': '1',
  //     'type': 'type',
  //     'private_message': privateMessageController,
  //     'title': titleController.text,
  //     'description': descriptionController.text,
  //     'timeline': 'timeline',
  //     'payment_type': 'paymentType',
  //     'is_published': 'isPublished',
  //     'experience_level': 'experienceLevel',
  //     'cover_letter_required': 'coverLetterRequired',
  //     'total_budget': '10000',
  //     'skill': [],
  //     'attachments': _returListOfParsedFiles(),
  //     'invited_artisan_ids': [],
  //   });
  // }

  List<MultipartFile> _returListOfParsedFiles() {
    List<MultipartFile> _multiPath = [];
    logger.d(_fileList.length);
    _fileList.map((e) async {
      _multiPath.add(
          await MultipartFile.fromFile(e.path, filename: _returnLastPath(e)));
      setState(() {});
    }).toList();
    return _multiPath;
  }

  void _pickImages() async {
    try {
      _image.pickImage(
          context: context,
          file: (file) async {
            // _file = file;
            _fileList.add(file);
            setState(() {});
          });
    } catch (e) {
      logger.e(e);
    }
  }

  String _returnLastPath(File file) => file.path.split('/').last;

  GestureDetector addSkills(String value, {Function()? onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: Pallets.primary100),
          child: TextView(
              color: Pallets.white,
              text: value,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center),
        ),
      );
}
