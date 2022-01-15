import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/widgets/body_widget.dart';
import 'package:client/views/widgets/buttons.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/edit_form_widget.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentSetting3 extends StatefulWidget {
  const PaymentSetting3({Key? key}) : super(key: key);

  @override
  _PaymentSetting3State createState() => _PaymentSetting3State();
}

class _PaymentSetting3State extends State<PaymentSetting3> {
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
              SizedBox(height: 30.h,),
              TextView(
                text: 'Card Number',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              EditFormField(
                decoration: _getDecoration('', dropDown: false),
              ),
              SizedBox(
                height: 35.h,
              ),
              TextView(
                text: 'Expiry Date',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              Padding(
                padding: EdgeInsets.only(right:100.w),
                child: Row(
                  children: [
                    Expanded(
                      child: EditFormField(
                        decoration: _getDecoration('Month', dropDown: true),
                      ),
                    ),
                    SizedBox(width: 30.w,),
                    Expanded(
                      child: EditFormField(
                        decoration: _getDecoration('Year', dropDown: true),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35.h,
              ),
              TextView(
                text: 'Name on Card',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              EditFormField(
                decoration: _getDecoration('', dropDown: false),
              ),
              SizedBox(
                height: 35.h,
              ),
              TextView(
                text: 'CVV',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              Padding(
                padding: EdgeInsets.only(right: 200.w),
                child: EditFormField(
                  decoration: _getDecoration('', dropDown: false),
                ),
              ),
              SizedBox(height: 16.h),
              EditFormField(
                decoration:
                    _getDecoration('Bank Account Number', dropDown: false),
              ),
              SizedBox(
                height: 60.h,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Checkbox(value: false, onChanged: (bool? value) {}),
                    TextView(
                      text: 'Make this your default payment method',
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: ButtonWidget(
                  buttonText: 'Add Payment Method', onPressed: () => null)),
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
