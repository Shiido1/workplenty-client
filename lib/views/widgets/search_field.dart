import 'package:client/core/helper/utils/images.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/widgets/edit_form_widget.dart';
import 'package:client/views/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchAndFilter extends StatelessWidget {
  final String? hint;
  final TextEditingController? textEditingController;
  final Function()? filter;
  final Function()? onPressed;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final bool? showFilter;
  final bool? readOnly;
  final Function()? onTap;
  final Function()? onFilter;
  final IconData? icon;

  const SearchAndFilter({
    Key? key,
    this.hint,
    this.textEditingController,
    this.filter,
    this.onPressed,
    this.onSubmitted,
    this.onChanged,
    this.onTap,
    this.onFilter,
    this.icon,
    this.showFilter = true,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: EditFormField(
              onChange: onChanged,
              label: hint ?? 'Search for gigs, live consultancy, home',
              suffixIcon: Icons.search),
        ),
        SizedBox(width: 5.w),
        Visibility(
          visible: showFilter ?? false,
          child: GestureDetector(
            onTap: onFilter,
            child: Container(
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Pallets.primary100),
              child: ImageLoader(path: AppImages.filter),
            ),
          ),
        ),
      ],
    );
  }
}
