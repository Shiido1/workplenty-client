import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/images.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/dashboard/profile/manage/payment/payment_settings_screen3.dart';
import 'package:client/views/widgets/body_widget.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/image_loader.dart';
import 'package:client/views/widgets/review_bg_card.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentSettings2 extends StatefulWidget {
  const PaymentSettings2({Key? key}) : super(key: key);

  @override
  _PaymentSettings2State createState() => _PaymentSettings2State();
}

class _PaymentSettings2State extends State<PaymentSettings2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: defaultAppBar2(context,
          title: 'Payout Settings',
          centerTitle: true,
          showClearButton: false,
          leadingWidget: IconButton(
              onPressed: () => PageRouter.goBack(context),
              icon: Icon(
                Icons.arrow_back,
                color: Pallets.white,
              )),
          textColor: Pallets.white),
      body: BodyWidget(
        child: Stack(
          children: [
            ListView(
              children: [
                ...[1, 1, 1].map((e) => widgetContainer()).toList()
              ],
            )
          ],
        ),
      ),
    );
  }

  widgetContainer() => GestureDetector(
        onTap: () => PageRouter.gotoWidget(PaymentSetting3(), context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ReviewBgCard(
            Container(
              padding: EdgeInsets.all(16.w),
              color: Pallets.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ImageLoader(
                    path: AppImages.master,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: 'Master Card Debit (5432)',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        TextView(
                          text: '02 / 2023',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        TextView(
                          text: 'Oluwafemi Allen',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_outline,
                        color: Pallets.red600,
                      ))
                ],
              ),
            ),
          ),
        ),
      );
}
