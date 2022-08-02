import 'package:client/views/dashboard/profile/payout/presentation/stateManager/provider/payout_provider.dart';
import 'package:client/views/dashboard/profile/payout/presentation/widgets/overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/helper/utils/pallets.dart';
import '../../../../widgets/body_widget.dart';
import '../../../../widgets/default_appbar.dart';
import '../../../../widgets/text_views.dart';

import 'widgets/deposit.dart';

class Payouts extends StatefulWidget {
  const Payouts({Key? key}) : super(key: key);

  @override
  State<Payouts> createState() => _PayoutsState();
}

class _PayoutsState extends State<Payouts> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    Provider.of<PayoutProvider>(context, listen: false).walletBallance();
    return Scaffold(
      appBar: defaultAppBar2(context,
          centerTitle: true, textColor: Pallets.white, title: 'Payout'),
      body: BodyWidget(
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _index = 0),
                    child: TextView(
                      text: 'Overview',
                      color: _index == 0 ? Pallets.primary150 : Pallets.grey,
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      maxLines: 1,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _index = 1),
                    child: TextView(
                      text: 'Deposit',
                      color: _index == 1 ? Pallets.primary150 : Pallets.grey,
                      textAlign: TextAlign.right,
                      fontWeight: FontWeight.w700,
                      maxLines: 1,
                      fontSize: 17.sp,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 16.h),
            _bodyWidget()
          ],
        ),
      ),
    );
  }

  _bodyWidget() {
    if (_index == 0) return GetOverviewWidget();
    return DepositWidget();
  }
}
