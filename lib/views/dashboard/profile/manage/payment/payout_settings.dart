import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/onboarding/domain/entity/payment/payout_entity.dart';
import 'package:client/views/widgets/body_widget.dart';
import 'package:client/views/widgets/buttons.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/edit_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/di/injector.dart';
import '../../../../../core/helper/utils/validators.dart';
import '../../../../../core/helper/utils/workplenty_dialog.dart';
import '../../../../onboarding/data/model/location_response/datum.dart';
import '../../../../onboarding/presentation/payout_folder/bloc/payout_transaction_bloc.dart';
import '../../../../widgets/country.dart';

class PayoutSettings extends StatefulWidget {
  PayoutSettings({Key? key}) : super(key: key);

  @override
  _PayoutSettingsState createState() => _PayoutSettingsState();
}

class _PayoutSettingsState extends State<PayoutSettings> {
  final _loadingKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  final _countryController = TextEditingController();
  final _accountNameController = TextEditingController();
  final _accountNumberController = TextEditingController();
  final _bankNameController = TextEditingController();

  final _bloc = PayoutTransactionBloc(inject());
  Datum? _country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: defaultAppBar2(context,
          title: 'Payment Settings',
          centerTitle: true,
          showClearButton: false,
          leadingWidget: IconButton(
              onPressed: () => PageRouter.goBack(context),
              icon: Icon(
                Icons.arrow_back,
                color: Pallets.white,
              )),
          textColor: Pallets.white),
      body: BlocListener<PayoutTransactionBloc, PayoutTransactionState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is PayoutTransactionLoading) {
            WorkPlenty.showLoading(context, _loadingKey, '');
          }
          if (state is PayoutTransactionSuccessful) {
            WorkPlenty.hideLoading(_loadingKey);
            WorkPlenty.showSnackBar(context, 'Payment made successfully');
            PageRouter.goBack(context);
          }
          if (state is PayoutTransactionFailed) {
            WorkPlenty.hideLoading(_loadingKey);
            WorkPlenty.error(state.message);
          }
        },
        child: BodyWidget(
            child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(16.w),
                child: ListView(
                  children: [
                    EditFormField(
                      decoration: _getDecoration('Country', dropDown: true),
                      onTapped: () => PageRouter.gotoWidget(Country(onTap: (v) {
                        _country = v;
                        _countryController.text = _country?.name ?? '';
                        setState(() {});
                      }), context),
                      validator: Validators.validateString(),
                      keyboardType: TextInputType.text,
                      readOnly: true,
                      controller: _countryController,
                    ),
                    SizedBox(height: 32.h),
                    EditFormField(
                      decoration: _getDecoration('Bank', dropDown: false),
                      controller: _bankNameController,
                      validator: Validators.validateString(),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 20.h),
                    EditFormField(
                      decoration:
                          _getDecoration('Bank Account Name', dropDown: false),
                      controller: _accountNameController,
                      validator: Validators.validateString(),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 20.h),
                    EditFormField(
                      decoration: _getDecoration('Bank Account Number',
                          dropDown: false),
                      controller: _accountNumberController,
                      validator: Validators.validateInt(),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonWidget(
                      buttonText: 'Save Details', onPressed: () => _proceed())),
            ],
          ),
        )),
      ),
    );
  }

  void _proceed() {
    if (_formKey.currentState!.validate()) {
      _bloc.add(StartPayoutTransactionEvent(PayoutEntity(
          accountName: _accountNameController.text.trim(),
          accountNumber: _accountNumberController.text.trim(),
          country: _countryController.text.trim(),
          bankName: _bankNameController.text.trim())));
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
