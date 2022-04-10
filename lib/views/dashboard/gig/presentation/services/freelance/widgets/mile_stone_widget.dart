import 'package:client/core/entity/milestone/milestone.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/core/helper/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/helper/utils/date_picker.dart';
import '../../../../../../widgets/edit_form_widget.dart';
import '../model/milestone.dart';

class MilestoneWidget extends StatelessWidget {
  final MilestoneModel milestone;
  final Function()? remove;
  final Function(String? v)? onDescription;
  final Function(String? v)? onDueDate;
  final Function(String? v)? onAmount;

  const MilestoneWidget(this.milestone,
      {Key? key,
      this.remove,
      this.onDescription,
      this.onDueDate,
      this.onAmount})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController? _descriptionController =
        TextEditingController(text: milestone.description ?? '');
    TextEditingController? _dueDateController =
        TextEditingController(text: milestone.dueDate ?? '');
    TextEditingController? _amountController =
        TextEditingController(text: milestone.amount?.toString() ?? '');

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: EditFormField(
              label: 'Milestone description',
              validator: Validators.validateString(),
              keyboardType: TextInputType.text,
              controller: _descriptionController,
              onChange: onDescription,
            )),
            SizedBox(width: 8.w),
            GestureDetector(
                onTap: remove,
                child: Icon(Icons.remove_circle, color: Pallets.red600))
          ],
        ),
        SizedBox(height: 15.h),
        Row(
          children: [
            Expanded(
              child: EditFormField(
                label: 'Due Date',
                readOnly: true,
                controller: _dueDateController,
                onTapped: () => pickDate(
                    dateOptions: DateOptions.future,
                    context: context,
                    onChange: (v) => onDueDate!(v)),
                validator: Validators.validateString(),
                keyboardType: TextInputType.text,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: EditFormField(
                label: 'Amount (NGN)',
                validator: Validators.validateInt(),
                keyboardType: TextInputType.number,
                controller: _amountController,
                onChange: onAmount,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
