import 'package:client/views/dashboard/saved/presentation/provider/provider.dart';
import 'package:client/views/dashboard/widget/home_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FreelanceTab extends StatefulWidget {
  const FreelanceTab({Key? key}) : super(key: key);

  @override
  State<FreelanceTab> createState() => _FreelanceTabState();
}

class _FreelanceTabState extends State<FreelanceTab> {
  SaveProfileListProvider? profileListProvider;

  @override
  void initState() {
    profileListProvider =
        Provider.of<SaveProfileListProvider>(context, listen: false);
    profileListProvider!.getSaveProfileList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: ListView(
        children: [
          ...[1, 2, 2, 2, 2, 2, 3].map((_) => HomeCard()).toList()
        ],
      ),
    );
  }
}
