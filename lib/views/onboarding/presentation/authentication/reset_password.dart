// ignore_for_file: unused_field

import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/core/helper/utils/validators.dart';
import 'package:client/views/widgets/body_widget.dart';
import 'package:client/views/widgets/buttons.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/edit_form_widget.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'welcom_back.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String? email;
  ResetPasswordScreen(this.email, {Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _loadingKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
  final _pinController = TextEditingController();
  bool _togglePassword = true;
  bool _isTypingPassword = false;

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
                text: 'Reset Password',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 4.h),
              TextView(
                text:
                    'Your new password must be different from previous used password',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 30.h),
              EditFormField(
                label: 'PIN',
                controller: _pinController,
                validator: Validators.validateInt(),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 18.h),
              EditFormField(
                label: 'Password',
                obscureText: _togglePassword,
                controller: _passwordController,
                validator: Validators.validatePlainPassword(),
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: _togglePassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                onChange: (password) {
                  password.isEmpty
                      ? _isTypingPassword = false
                      : _isTypingPassword = true;
                  setState(() {});
                },
                suffixIconColor:
                    _isTypingPassword ? Pallets.primary100 : Pallets.grey,
                onPasswordToggle: () =>
                    setState(() => _togglePassword = !_togglePassword),
              ),
              SizedBox(height: 18.h),
              ButtonWidget(
                  buttonText: 'Reset password', onPressed: () => _proceed()),
              SizedBox(height: 18.h),
            ],
          ),
        ),
      ),
    );
  }

  void _proceed() {
    PageRouter.gotoWidget(WelcomeBackScreen(), context);
    // if (_formKey.currentState!.validate()) {
    //   _bloc.add(ResetPasswordEvent(
    //       entity: ResetPasswordEntity(
    //           email: widget.email,
    //           pin: '121212',
    //           password: _passwordController.text)));
    // }
  }
}
