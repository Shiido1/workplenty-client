import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/helper/utils/images.dart';
import '../../../../../../../core/helper/utils/validators.dart';
import '../../../../../../widgets/edit_form_widget.dart';
import '../../../../../../widgets/review_bg_card.dart';
import '../../../provider/artisan_provider.dart';
import '../../../widget/row_container_widget.dart';

class SecondBadgeWidget extends StatelessWidget {
  const SecondBadgeWidget({
    Key? key,
    required this.privateMessageController,
    required this.titleController,
    required this.descriptionController,
    required this.title,
    required this.description,
  }) : super(key: key);

  final TextEditingController privateMessageController;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Consumer<ArtisanProvider>(
      builder: (context, value, child) {
        return ReviewBgCard(
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RowContainer(
                    image: AppImages.message,
                    text:
                        'Private Message to  ${value.datum?.user?.firstName ?? ''} ${value.datum?.user?.lastName ?? ''}'),
                SizedBox(height: 10.h),
                EditFormField(
                  height: 150.h,
                  label: 'Type here..',
                  controller: privateMessageController,
                  validator: Validators.validateString(),
                ),
                SizedBox(height: 23.h),
                RowContainer(image: AppImages.t_message, text: title),
                SizedBox(height: 10.h),
                EditFormField(
                  controller: titleController,
                  validator: Validators.validateString(),
                  label: 'Type here..',
                ),
                SizedBox(height: 23.h),
                RowContainer(image: AppImages.brief_case, text: description),
                SizedBox(height: 10.h),
                EditFormField(
                    height: 150.h,
                    label: 'Type here..',
                    controller: descriptionController,
                    validator: Validators.validateString()),
              ],
            ),
            borderRadiusGeometry: BorderRadius.zero,
            vertical: 25.33);
      },
    );
  }
}
