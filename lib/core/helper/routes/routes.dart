import 'package:client/views/dashboard/board.dart';
import 'package:client/views/onboarding/screens/services/freelance_job_service.dart';
import 'package:client/views/onboarding/screens/services/home_service.dart';
import 'package:client/views/onboarding/screens/services/live_consultancy_service.dart';
import 'package:flutter/cupertino.dart';

BuildContext? globalContext;

class Routes {
  static const String selection = '/selection';
  static const String board = '/board';
  static const String login = '/login';
  static const String freelance = '/freelance';
  static const String home_service = '/home_service';
  static const String consultancy = '/consultancy';

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
          globalContext = context;
          return MainBoard();
        },
      };
}
