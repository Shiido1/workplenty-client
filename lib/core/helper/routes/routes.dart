import 'package:client/core/helper/configs/instances.dart';
import 'package:client/views/dashboard/board.dart';
import 'package:client/views/onboarding/data/model/auth/verification_pin_request_response/verification_pin_request_response.dart';
import 'package:client/views/onboarding/presentation/authentication/email_verification.dart';
import 'package:client/views/onboarding/presentation/screens/services/freelance_job_service.dart';
import 'package:client/views/onboarding/presentation/screens/services/home_service.dart';
import 'package:client/views/onboarding/presentation/screens/services/live_consultancy_service.dart';

import 'package:flutter/cupertino.dart';

BuildContext? globalContext;

class Routes {
  static const String selection = '/selection';
  static const String board = '/board';
  static const String login = '/login';
  static const String freelance = '/freelance';
  static const String home_service = '/home_service';
  static const String consultancy = '/consultancy';
  static const String verifyPin = '/verifyPin';

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
          final args = ModalRoute.of(context)!.settings.arguments as String;
          return EmailVerificationScreen(args);
        }
      };
}
