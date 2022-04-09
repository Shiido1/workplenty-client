import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/widgets/body_widget.dart';
import 'package:client/views/widgets/buttons.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/edit_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordSecurityScreen extends StatelessWidget {
  const PasswordSecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: defaultAppBar2(context,
          title: 'Password & Security',
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
              EditFormField(
                decoration: _getDecoration('Old Password'),
              ),
              SizedBox(height: 32.h),
              EditFormField(
                decoration: _getDecoration('New Password'),
              ),
              SizedBox(height: 32.h),
              EditFormField(decoration: _getDecoration('Confirm Password')),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: ButtonWidget(
                  buttonText: 'Change Password', onPressed: () {})),
        ],
      )),
    );
  }

  _getDecoration(String hint) {
    return InputDecoration(
      border: UnderlineInputBorder(borderSide: BorderSide(color: Pallets.grey)),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Pallets.grey)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Pallets.grey)),
      errorBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      disabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Pallets.grey)),
      labelText: hint,
    );
  }
}
