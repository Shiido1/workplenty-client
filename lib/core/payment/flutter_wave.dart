import 'package:client/core/network/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave_standard/flutterwave.dart';

import '../database/session_manager.dart';
import '../entity/user/user.dart';
import '../helper/utils/images.dart';
import '../helper/utils/pallets.dart';
import '../network/url_config.dart';

class HandleFlutterWavePayment {
  static Future<ChargeResponse?> handlePaymentInitialization(
      BuildContext context, String amount) async {
    final _user = User.fromJson(SessionManager.instance.usersData);

    final style = FlutterwaveStyle(
        appBarText: "Workplenty",
        buttonColor: Pallets.primary100,
        appBarIcon: Icon(Icons.arrow_back, color: Pallets.white),
        appBarTitleTextStyle: TextStyle(color: Pallets.white, fontSize: 24),
        buttonTextStyle: TextStyle(
          color: Pallets.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        appBarColor: Pallets.primary100,
        dialogCancelTextStyle: TextStyle(
          color: Colors.redAccent,
          fontSize: 18,
        ),
        dialogContinueTextStyle: TextStyle(
          color: Colors.blue,
          fontSize: 18,
        ));
    final Customer customer = Customer(
        name: "${_user.firstName ?? ''} ${_user.lastName ?? ''}",
        phoneNumber: '${_user.phone ?? ''}',
        email: _user.email!);
    try {
      final _flutterwave = new Flutterwave(
          context: context,
          style: style,
          publicKey: AppConfig.flutterWavePublicKey,
          currency: "NGN",
          txRef: DateTime.now().toIso8601String(),
          amount: amount,
          customer: customer,
          paymentOptions: "ussd, card, barter, payattitude",
          customization: Customization(
              title: "Workplenty", description: '', logo: AppImages.logo),
          isTestMode: AppConfig.flutterWaveMode);

      return await _flutterwave.charge();
    } catch (e) {
      return null;
    }
  }
}
