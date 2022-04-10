import 'package:flutter/material.dart';

import '../../../../../../core/helper/utils/pallets.dart';
import '../../../../../widgets/buttons.dart';

class ButtonW extends StatelessWidget {
  final String? title;
  final int? defaultValue;
  final int? index;
  final Function()? onTap;

  const ButtonW(
      {required this.title,
      required this.defaultValue,
      required this.index,
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
        borderColor: index == defaultValue ? Pallets.white : Pallets.grey,
        color: index == defaultValue ? Pallets.white : Pallets.grey,
        primary: index == defaultValue ? Pallets.primary100 : Pallets.white,
      ),
    );
  }
}
