import 'package:client/core/di/injector.dart';
import 'package:client/core/helper/configs/instances.dart';
import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/dashboard/card/domain/entity/card_entity.dart';
import 'package:client/views/dashboard/card/presentation/bloc/card_bloc.dart';
import 'package:client/views/widgets/body_widget.dart';
import 'package:client/views/widgets/buttons.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/edit_form_widget.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/utils/workplenty_dialog.dart';

class PaymentSetting3 extends StatefulWidget {
  const PaymentSetting3({Key? key}) : super(key: key);

  @override
  _PaymentSetting3State createState() => _PaymentSetting3State();
}

class _PaymentSetting3State extends State<PaymentSetting3> {
  final _loadingKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  final _cardNumberController = TextEditingController();
  final _cardNameController = TextEditingController();
  final _expMonthController = TextEditingController();
  final _expYearController = TextEditingController();
  final _bankAccountNumberController = TextEditingController();
  final _cvvController = TextEditingController();

  final _bloc = CardBloc(inject());

  bool isCheck = false;

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
      body: BlocListener<CardBloc, CardState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is CardLoadingState) {
            WorkPlenty.showLoading(context, _loadingKey, '');
          }
          if (state is CardSuccessState) {
            WorkPlenty.hideLoading(_loadingKey);
            PageRouter.goBack(context);
          }
          if (state is CardFailedState) {
            WorkPlenty.hideLoading(_loadingKey);
            logger.d(state.message);
            WorkPlenty.error(state.message);
          }
        },
        child: Form(
          key: _formKey,
          child: BodyWidget(
              child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(8.w),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    TextView(
                      text: 'Card Number',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    EditFormField(
                      controller: _cardNumberController,
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
                      padding: EdgeInsets.only(right: 100.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: EditFormField(
                              decoration:
                                  _getDecoration('Month', dropDown: true),
                              controller: _expMonthController,
                            ),
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          Expanded(
                            child: EditFormField(
                              decoration:
                                  _getDecoration('Year', dropDown: true),
                              controller: _expYearController,
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
                      controller: _cardNameController,
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
                        controller: _cvvController,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    EditFormField(
                      decoration: _getDecoration('Bank Account Number',
                          dropDown: false),
                      controller: _bankAccountNumberController,
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: [
                          Checkbox(
                              activeColor: Pallets.primary100,
                              value: isCheck,
                              onChanged: (bool? value) {
                                setState(() {
                                  isCheck = !isCheck;
                                });
                              }),
                          TextView(
                            text: 'Make this your default payment method',
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.left,
                            fontSize: 17.sp,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonWidget(
                      buttonText: 'Add Payment Method',
                      onPressed: () => _proceed())),
            ],
          )),
        ),
      ),
    );
  }

  void _proceed() {
    if (_formKey.currentState!.validate() && isCheck == true) {
      String? firstDigit = _cardNumberController.text.substring(0, 4);
      var lastDigit = _cardNumberController.text
          .substring(_cardNumberController.text.length - 4);
      print('$firstDigit - - $lastDigit');
      _bloc.add(StartCardEvent(CardEntity(
          name: _cardNameController.text.trim(),
          firstDigit: firstDigit,
          lastDigit: lastDigit,
          expMonth: _expMonthController.text.trim(),
          expYear: _expYearController.text.trim(),
          number: _cardNumberController.text.trim(),
          cvv: _cvvController.text.trim())));
    }
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
