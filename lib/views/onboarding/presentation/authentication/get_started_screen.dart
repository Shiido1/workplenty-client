import 'package:client/core/di/injector.dart';
import 'package:client/core/helper/configs/instances.dart';
import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/routes/routes.dart';
import 'package:client/core/helper/utils/images.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/core/helper/utils/validators.dart';
import 'package:client/core/helper/utils/workplenty_dialog.dart';
import 'package:client/views/onboarding/domain/entity/auth/auth_entity.dart';
import 'package:client/views/onboarding/presentation/profile/profile_setup.dart';
import 'package:client/views/widgets/body_widget.dart';
import 'package:client/views/widgets/buttons.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/edit_form_widget.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/authbloc_bloc.dart';
import 'welcom_back.dart';

class GetStartedScreen extends StatefulWidget {
  GetStartedScreen({Key? key}) : super(key: key);

  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final _loadingKey = GlobalKey<FormState>();
  final _globalFormKey = GlobalKey<FormState>();
  bool _togglePassword = true;
  bool _isTypingPassword = false;

  final _fnController = TextEditingController();
  final _lnController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  Country? _country;
  final _bloc = AuthblocBloc(inject());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: BodyWidget(
        child: BlocListener<AuthblocBloc, AuthblocState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state is AuthblocLoading) {
              WorkPlenty.showLoading(context, _loadingKey, '');
            }
            if (state is AuthblocSuccess) {
              WorkPlenty.hideLoading(_loadingKey);
              PageRouter.gotoNamed(Routes.verifyPin, context, args: {
                'email': _emailController.text,
                'name': _fnController.text
              });
            }
            if (state is AuthblocFailed) {
              WorkPlenty.hideLoading(_loadingKey);
              WorkPlenty.error(state.message);
            }
          },
          child: Form(
            key: _globalFormKey,
            child: ListView(
              children: [
                TextView(
                  text: 'Get Started',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                TextView(
                  text:
                      'Create an account and find projects you are excited to work on 2x faster on WorkPlenty.',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 30.h),
                EditFormField(
                  label: 'First Name',
                  controller: _fnController,
                  validator: Validators.validateString(),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 18.h),
                EditFormField(
                  label: 'Last Name',
                  controller: _lnController,
                  validator: Validators.validateString(),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 18.h),
                EditFormField(
                  label: 'Username',
                  controller: _usernameController,
                  validator: Validators.validateString(),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 18.h),
                EditFormField(
                  label: 'Email Address',
                  controller: _emailController,
                  validator: Validators.validateEmail(),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 18.h),
                EditFormField(
                  label: 'Phone Number',
                  controller: _phoneController,
                  validator: Validators.validatePhone(),
                  keyboardType: TextInputType.phone,
                  prefixWidget: GestureDetector(
                    onTap: () => showCountryPicker(
                      context: context,
                      countryListTheme: const CountryListThemeData(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      showPhoneCode: true,
                      onSelect: (Country country) {
                        setState(() => _country = country);
                      },
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextView(
                              text: '+${_country?.phoneCode ?? '234'}',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Pallets.grey900,
                              textAlign: TextAlign.center),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Pallets.grey900,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18.h),
                EditFormField(
                  label: 'Password',
                  controller: _passwordController,
                  obscureText: _togglePassword,
                  suffixIcon: _togglePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  onChange: (password) {
                    password.isEmpty
                        ? _isTypingPassword = false
                        : _isTypingPassword = true;
                    setState(() {});
                  },
                  onPasswordToggle: () =>
                      setState(() => _togglePassword = !_togglePassword),
                  suffixIconColor:
                      _isTypingPassword ? Pallets.primary100 : Pallets.grey,
                  validator: Validators.validatePlainPassword(),
                ),
                SizedBox(height: 18.h),
                ButtonWidget(
                    buttonText: 'Continue', onPressed: () => _proceed()),
                SizedBox(height: 57.h),
                Wrap(alignment: WrapAlignment.center, children: [
                  TextView(
                      text: 'By signing up, you’re agreeing to our ',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  TextView(
                      text: 'Terms of Use',
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                  TextView(
                      text: ' and ', fontSize: 14, fontWeight: FontWeight.w400),
                  TextView(
                      text: 'Privacy Policy',
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ]),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(flex: 3, child: Divider()),
                    Expanded(
                        child: TextView(
                      text: 'OR',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                    )),
                    Expanded(flex: 3, child: Divider()),
                  ],
                ),
                SizedBox(height: 18.h),
                ButtonWidget(
                    buttonText: 'Continue with Google',
                    buttonStyle: true,
                    color: Pallets.primary150,
                    primary: Pallets.skyBlue,
                    borderColor: Pallets.skyBlue,
                    icon: AppImages.google,
                    onPressed: () =>
                        PageRouter.gotoWidget(SetUpProfile(), context)),
                SizedBox(height: 18.h),
                ButtonWidget(
                    buttonText: 'Continue with Meta',
                    buttonStyle: true,
                    color: Pallets.primary150,
                    primary: Pallets.skyBlue,
                    borderColor: Pallets.skyBlue,
                    icon: AppImages.meta,
                    onPressed: () {}),
                SizedBox(height: 16.h),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Wrap(alignment: WrapAlignment.center, children: [
                    TextView(
                        text: 'Already on WorkPlenty? ',
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                    TextView(
                      text: 'Sign in',
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      onTap: () =>
                          PageRouter.gotoWidget(WelcomeBackScreen(), context),
                    ),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _proceed() {
    if (_globalFormKey.currentState!.validate()) {
      _bloc.add(RegisterEvent(AuthEntity(
          email: _emailController.text,
          firstName: _fnController.text,
          lastName: _lnController.text,
          username: _usernameController.text,
          phone: '+${_country?.phoneCode ?? '234'}${_phoneController.text}',
          password: _passwordController.text)));
    }
  }
}
