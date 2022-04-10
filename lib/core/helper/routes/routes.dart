import 'package:client/views/dashboard/board.dart';
import 'package:client/views/dashboard/gig/presentation/services/freelance/freelance_job_service.dart';
import 'package:client/views/dashboard/gig/presentation/services/home_service.dart';
import 'package:client/views/dashboard/gig/presentation/services/live_consultancy_service.dart';
import 'package:client/views/onboarding/presentation/authentication/email_verification.dart';
import 'package:client/views/onboarding/presentation/authentication/welcom_back.dart';
import 'package:client/views/onboarding/presentation/intro/intro_screen.dart';
import 'package:flutter/cupertino.dart';

import '../../../views/onboarding/presentation/authentication/reset_password.dart';

BuildContext? globalContext;

class Routes {
  static const String selection = '/selection';
  static const String board = '/board';
  static const String login = '/login';
  static const String freelance = '/freelance';
  static const String home_service = '/home_service';
  static const String consultancy = '/consultancy';
  static const String verifyPin = '/verifyPin';
  static const String forgotPassword = '/forgotPassword';
  static const String intro = '/intro';

  static Map<String, Widget Function(BuildContext mainContext)> get getRoutes =>
      {
        selection: (BuildContext context) {
          globalContext = context;
          return Container();
        },
        freelance: (BuildContext context) {
          globalContext = context;
          return FreeLanceJobService();
        },
        home_service: (BuildContext context) {
          globalContext = context;
          return HomeService();
        },
        consultancy: (BuildContext context) {
          globalContext = context;
          return LiveConsultancy();
        },
        board: (BuildContext context) {
          return MainBoard();
        },
        verifyPin: (BuildContext context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          return EmailVerificationScreen(args);
        },
        forgotPassword: (BuildContext context) {
          final args = ModalRoute.of(context)!.settings.arguments as String;
          return ResetPasswordScreen(args);
        },
        login: (BuildContext context) => WelcomeBackScreen(),
        intro: (BuildContext context) => IntroOneScreen()
      };
}
