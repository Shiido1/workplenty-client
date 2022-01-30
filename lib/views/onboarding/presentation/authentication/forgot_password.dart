import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/validators.dart';
import 'package:client/views/widgets/body_widget.dart';
import 'package:client/views/widgets/buttons.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/edit_form_widget.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'reset_password.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _loadingKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: BodyWidget(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextView(
                text: 'Forget Password',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 4.h),
              TextView(
                text:
                    'Type in your email address below and we will send you instructions on how to reset your password.',
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 29.h),
              EditFormField(
                label: 'Email Address',
                controller: _emailController,
                validator: Validators.validateEmail(),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 24.h),
              ButtonWidget(
                  buttonText: 'Send Instructions', onPressed: () => _proceed()),
              SizedBox(height: 18.h),
            ],
          ),
        ),
      ),
    );
  }

  void _proceed() {
    PageRouter.gotoWidget(ResetPasswordScreen(_emailController.text), context);
    // if (_formKey.currentState!.validate()) {
    //   _bloc.add(ForgotPasswordEvent(
    //       entity: ForgotPasswordEntity(email: _emailController.text)));
    // }
  }
}