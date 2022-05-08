import 'package:client/core/enums/project_type.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/helper/utils/pallets.dart';
import '../../../../../widgets/buttons.dart';

class ButtonW extends StatelessWidget {
  final String? title;
  final ProjectType? defaultProjectType;
  final ProjectType? projectType;
  final Function()? onTap;

  const ButtonW(
      {required this.title,
      required this.defaultProjectType,
      required this.projectType,
      required this.onTap,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ButtonWidget(
        buttonText: title!,
        onPressed: onTap,
        buttonStyle: true,
        fontSize: 13,
        borderColor:
            projectType == defaultProjectType ? Pallets.white : Pallets.grey,
        color: projectType == defaultProjectType ? Pallets.white : Pallets.grey,
        primary: projectType == defaultProjectType
            ? Pallets.primary100
            : Pallets.white,
      ),
    );
  }
}
