import 'package:client/views/dashboard/gig/domain/source/local/saved_gig_dao.dart';
import 'package:client/views/dashboard/gig/presentation/provider/saved_gig_list_provider.dart';
import 'package:client/views/dashboard/saved/presentation/provider/provider.dart';
import 'package:client/views/dashboard/widget/home_card_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class FreelanceTab extends StatefulWidget {
  const FreelanceTab({Key? key}) : super(key: key);

  @override
  State<FreelanceTab> createState() => _FreelanceTabState();
}

class _FreelanceTabState extends State<FreelanceTab> {
  SaveProfileListProvider? profileListProvider;
  SavedGigListProvider? savedGigListProvider;

  @override
  void initState() {
    profileListProvider =
        Provider.of<SaveProfileListProvider>(context, listen: false);
    profileListProvider!.getSaveProfileList();
    savedGigListProvider =
        Provider.of<SavedGigListProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: FutureBuilder(
        future: savedGigDao!.getListenable(),
        builder: (BuildContext context,
            AsyncSnapshot<ValueListenable<Box<dynamic>>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) return Container();
          return ValueListenableBuilder(
              valueListenable: snapshot.data!,
              builder: (_, Box<dynamic> value, __) {
                final _savedGigList =
                    savedGigDao!.getConvertedData(savedGigDao!.box!).toList();

                return ListView(
                  children: [
                    // ..._savedGigList.map((saved) => HomeCard(datum: saved)).toList()
                  ],
                );
              });
        },
      ),
    );
  }
}
