import 'package:client/core/di/injector.dart';
import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/routes/routes.dart';
import 'package:client/core/helper/utils/images.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/core/helper/utils/validators.dart';
import 'package:client/core/helper/utils/workplenty_dialog.dart';
import 'package:client/views/onboarding/authentication/domain/entities/register_entity.dart';
import 'package:client/views/onboarding/authentication/presentation/login/welcome_back.dart';
import 'package:client/views/onboarding/authentication/presentation/register/bloc/register_bloc.dart';
import 'package:client/views/onboarding/profile/profile_setup.dart';
import 'package:client/views/widgets/body_widget.dart';
import 'package:client/views/widgets/buttons.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/edit_form_widget.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedScreen extends StatefulWidget {
  GetStartedScreen({Key? key}) : super(key: key);

  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final _globalFormKey = GlobalKey<FormState>();
  final _loadingKey = GlobalKey<FormState>();
  final TextEditingController? _fNameController = TextEditingController();
  final TextEditingController? _lNameController = TextEditingController();
  final TextEditingController? _phoneController = TextEditingController();
  final TextEditingController? _roleController = TextEditingController();
  final TextEditingController? _userNameController = TextEditingController();
  final TextEditingController? _emailController = TextEditingController();
  final TextEditingController? _passwordController = TextEditingController();
  final _registerBloc = RegisterBloc(inject());
  bool _obsecureText = true;

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  /// disposes of controller
  void _disposeControllers() {
    _fNameController!.dispose();
    _lNameController!.dispose();
    _phoneController!.dispose();
    _roleController!.dispose();
    _userNameController!.dispose();
    _emailController!.dispose();
    _passwordController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: defaultAppBar(context),
        body: BlocListener<RegisterBloc, RegisterState>(
          bloc: _registerBloc,
          listener: (context, state) {
            if (state is RegisterLoadingState) {
              WorkPlenty.showLoading(context, _loadingKey, 'Signing up...');
            }
            if (state is RegisterSuccessState) {
              WorkPlenty.hideLoading(_loadingKey);
              WorkPlenty.showSnackBar(context, 'Sign up Successful');
              PageRouter.gotoNamed(Routes.board, context, clearStack: true);
            }
            if (state is RegisterFailedState) {
              WorkPlenty.hideLoading(_loadingKey);
              WorkPlenty.showSnackBar(context, state.message, error: true);
            }
          },
          child: BodyWidget(
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
                  controller: _fNameController,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  validator: Validators.validateString(),
                ),
                SizedBox(height: 18.h),
                EditFormField(
                  label: 'Last Name',
                  controller: _lNameController,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  validator: Validators.validateString(),
                ),
                SizedBox(height: 18.h),
                EditFormField(
                  label: 'Username',
                  controller: _userNameController,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  validator: Validators.validateString(),
                ),
                SizedBox(height: 18.h),
                EditFormField(
                  label: 'Email Address',
                  controller: _emailController,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.validateEmail(),
                ),
                SizedBox(height: 18.h),
                EditFormField(
                  label: 'Phone Number',
                  controller: _phoneController,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  // keyboardType: TextInputType.phone,
                  // validator: Validators.validatePhone(),
                ),
                SizedBox(height: 18.h),
                EditFormField(
                  label: 'Role',
                  controller: _roleController,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  validator: Validators.validateString(),
                ),
                SizedBox(height: 18.h),
                EditFormField(
                  label: 'Password',
                  keyboardType: TextInputType.text,
                  controller: _passwordController,
                  obscureText: _obsecureText,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  onPasswordToggle: () =>
                      setState(() => _obsecureText = !_obsecureText),
                  suffixIcon: _obsecureText
                      ? Icons.visibility
                      : Icons.visibility_off_outlined,
                  validator: Validators.validatePlainPassword()!,
                ),
                SizedBox(height: 18.h),
                ButtonWidget(buttonText: 'Continue', onPressed: () => signUp()),
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
                Wrap(alignment: WrapAlignment.center, children: [
                  TextView(
                      text: 'Already on WorkPlenty? ',
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  TextView(
                    text: 'Sign in',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    onTap: () =>
                        PageRouter.gotoWidget(WelcomeBackScreen(), context),
                  ),
                ]),
              ],
            ),
          )),
        ));
  }

  void signUp() {
    FocusScope.of(context).unfocus();
    if (_globalFormKey.currentState!.validate()) {
      _registerBloc.add(StartRegisterEvent(
          registerEntity: RegisterEntity(
        email: _emailController!.text,
        lastName: _lNameController!.text,
        firstName: _fNameController!.text,
        password: _passwordController!.text,
        phone: _phoneController!.text,
        role: _roleController!.text,
      )));
    }
  }
}
