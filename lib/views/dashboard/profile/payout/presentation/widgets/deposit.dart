import 'package:client/core/helper/configs/instances.dart';
import 'package:client/views/dashboard/profile/payout/presentation/stateManager/provider/payout_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/di/injector.dart';
import '../../../../../../core/helper/helper_handler.dart';
import '../../../../../../core/helper/utils/validators.dart';
import '../../../../../../core/payment/flutter_wave.dart';
import '../../../../../widgets/buttons.dart';
import '../../../../../widgets/edit_form_widget.dart';
import '../stateManager/bloc/payout_bloc.dart';

class DepositWidget extends StatefulWidget {
  const DepositWidget({Key? key}) : super(key: key);

  @override
  State<DepositWidget> createState() => _DepositWidgetState();
}

class _DepositWidgetState extends State<DepositWidget> {
  final _controller = TextEditingController();
  final _key = GlobalKey<FormState>();
  final _bloc = PayoutBloc(inject());
  final _loadingKey = GlobalKey<FormState>();

  @override
  void initState() {
    Provider.of<PayoutProvider>(context, listen: false).walletBallance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PayoutBloc, PayoutState>(
      bloc: _bloc,
      listener: (context, state) {
        /*    if (state is PayoutLoading) {
          WorkPlenty.showLoading(context, _loadingKey, '');
        }
        if (state is PayoutSucess) {
          WorkPlenty.hideLoading(_loadingKey);
          WorkPlenty.success(state.response?.msg ?? 'Request successfully!');
          PageRouter.goBack(context);
        }
        if (state is PayoutMessage) {
          WorkPlenty.hideLoading(_loadingKey);
          WorkPlenty.error(state.message);
        } */
      },
      child: Form(
        key: _key,
        child: Consumer<PayoutProvider>(
          builder: (context, provider, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*          ImageBgCard(Row(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: 'Pending Withdrawal',
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w500,
                          color: Pallets.grey,
                          maxLines: 1,
                        ),
                        SizedBox(height: 5.h),
                        TextView(
                          text: Utils.currency(0),
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w700,
                          color: Pallets.white,
                          maxLines: 1,
                        ),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextView(
                          text: 'Withdraw',
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w500,
                          color: Pallets.grey,
                          maxLines: 1,
                        ),
                        SizedBox(height: 5.h),
                        TextView(
                          text: Utils.currency(0),
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w700,
                          color: Pallets.white,
                          maxLines: 1,
                        ),
                      ],
                    )),
                  ],
                )),
                SizedBox(height: 43.h), */
                /*  TextView(
                  text: 'Request Withdrawal',
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Pallets.primary150,
                  maxLines: 1,
                ), */
                SizedBox(height: 16.h),
                EditFormField(
                  controller: _controller,
                  label: 'Amount (NGN)',
                  validator: Validators.validateAmount(),
                ),
                SizedBox(height: 18.h),
                ButtonWidget(
                    width: Utils.getDeviceWidth(context),
                    buttonText: 'Make Deposit',
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        _fundWallet(_controller.text);
                      }
                    }),
                SizedBox(height: 16.h),
              ],
            );
            ;
          },
        ),
      ),
    );
  }

  void _fundWallet(String amount) async {
    try {
      ChargeResponse? _response =
          await HandleFlutterWavePayment.handlePaymentInitialization(
              context, amount);

      logger.d(_response?.toJson());
    } catch (e) {
      logger.e(e.toString());
    }
  }
}
