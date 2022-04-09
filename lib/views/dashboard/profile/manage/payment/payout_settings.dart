import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/dashboard/profile/manage/payment/payment_settings2.dart';
import 'package:client/views/widgets/body_widget.dart';
import 'package:client/views/widgets/buttons.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/edit_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PayoutSettings extends StatefulWidget {
  PayoutSettings({Key? key}) : super(key: key);

  @override
  _PayoutSettingsState createState() => _PayoutSettingsState();
}

class _PayoutSettingsState extends State<PayoutSettings> {
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
          Padding(
            padding: EdgeInsets.all(16.w),
            child: ListView(
              children: [
                EditFormField(
                  decoration: _getDecoration('Country', dropDown: true),
                ),
                SizedBox(height: 32.h),
                EditFormField(
                  decoration: _getDecoration('Bank', dropDown: true),
                ),
                SizedBox(height: 32.h),
                EditFormField(
                  decoration:
                      _getDecoration('Bank Account Name', dropDown: false),
                ),
                SizedBox(height: 32.h),
                EditFormField(
                  decoration:
                      _getDecoration('Bank Account Number', dropDown: false),
                ),
                SizedBox(height: 32.h),
                EditFormField(
                  decoration: _getDecoration('BVN', dropDown: false),
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: ButtonWidget(
                  buttonText: 'Save Details',
                  onPressed: () =>
                      PageRouter.gotoWidget(PaymentSettings2(), context))),
        ],
      )),
    );
  }

  _getDecoration(String hint, {bool? dropDown}) {
    return InputDecoration(
        border:
            UnderlineInputBorder(borderSide: BorderSide(color: Pallets.grey)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Pallets.grey)),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Pallets.grey)),
        errorBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        disabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Pallets.grey)),
        labelText: hint,
        suffixIcon: dropDown! ? Icon(Icons.keyboard_arrow_down) : null);
  }
}
