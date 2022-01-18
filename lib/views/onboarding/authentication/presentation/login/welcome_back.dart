import 'package:client/core/di/injector.dart';
import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/routes/routes.dart';
import 'package:client/core/helper/utils/images.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/core/helper/utils/validators.dart';
import 'package:client/core/helper/utils/workplenty_dialog.dart';
import 'package:client/views/onboarding/authentication/domain/entities/login_entity.dart';
import 'package:client/views/onboarding/authentication/email_verification.dart';
import 'package:client/views/onboarding/authentication/forgot_password.dart';
import 'package:client/views/onboarding/authentication/presentation/register/get_started_screen.dart';
import 'package:client/views/onboarding/authentication/presentation/login/bloc/login_bloc.dart';
import 'package:client/views/widgets/body_widget.dart';
import 'package:client/views/widgets/buttons.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/edit_form_widget.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeBackScreen extends StatefulWidget {
  WelcomeBackScreen({Key? key}) : super(key: key);

  @override
  _WelcomeBackScreenState createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen> {
  final _globalFormKey = GlobalKey<FormState>();
  final _loadingKey = GlobalKey<FormState>();
  final TextEditingController? _emailController = TextEditingController();
  final TextEditingController? _passwordController = TextEditingController();
  final _loginBloc = LoginBloc(inject());
  bool _obsecureText = true;

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  /// disposes of controller
  void _disposeControllers() {
    _emailController!.dispose();
    _passwordController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: defaultAppBar(context),
        body: BlocListener<LoginBloc, LoginState>(
          bloc: _loginBloc,
          listener: (context, state) {
            if (state is LoginLoadingState) {
              WorkPlenty.showLoading(context, _loadingKey, 'Log in...');
            }
            if (state is LoginSuccessState) {
              WorkPlenty.hideLoading(_loadingKey);
              WorkPlenty.showSnackBar(context, 'Login Successful');
              PageRouter.gotoNamed(Routes.board, context, clearStack: true);
            }
            if (state is LoginFailedState) {
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
                    text: 'Welcome Back',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 4.h),
                  TextView(
                    text: 'Signin to your account.',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 30.h),
                  EditFormField(
                    label: 'Email Address',
                    controller: _emailController,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.validateEmail(),
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
                  SizedBox(height: 12.h),
                  TextView(
                      text: 'Forget Password ?',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      onTap: () => PageRouter.gotoWidget(
                          ForgotPasswordScreen(), context),
                      textAlign: TextAlign.right),
                  SizedBox(height: 19.h),
                  ButtonWidget(
                    buttonText: 'Sign in',
                    onPressed: () => _loginUser(),
                  ),
                  SizedBox(height: 57.h),
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
                      onPressed: () {}),
                  SizedBox(height: 18.h),
                  ButtonWidget(
                      buttonText: 'Continue with Meta',
                      buttonStyle: true,
                      color: Pallets.primary150,
                      primary: Pallets.skyBlue,
                      borderColor: Pallets.skyBlue,
                      icon: AppImages.meta,
                      onPressed: () => PageRouter.gotoWidget(
                          EmailVerificationScreen(), context)),
                  SizedBox(height: 16.h),
                  Wrap(alignment: WrapAlignment.center, children: [
                    TextView(
                        text: 'Not on WorkPlenty? ',
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    TextView(
                      text: 'Sign up',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      onTap: () =>
                          PageRouter.gotoWidget(GetStartedScreen(), context),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ));
  }

  void _loginUser() {
    FocusScope.of(context).unfocus();
    if (_globalFormKey.currentState!.validate()) {
      _loginBloc.add(StartLoginEvent(
          loginEntity: LoginEntity(
              email: _emailController!.text,
              password: _passwordController!.text)));
    }
  }
}
