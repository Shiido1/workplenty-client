import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/helper/utils/images.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(child: SvgPicture.asset(AppImages.empty));
  }
}
