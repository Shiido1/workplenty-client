import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/core/helper/utils/images.dart';
import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/dashboard/card/domain/entity/card_entity.dart';
import 'package:client/views/dashboard/profile/manage/payment/payment_settings_screen3.dart';
import 'package:client/views/widgets/body_widget.dart';
import 'package:client/views/widgets/default_appbar.dart';
import 'package:client/views/widgets/image_loader.dart';
import 'package:client/views/widgets/review_bg_card.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../../../core/di/injector.dart';
import '../../../../../core/helper/utils/workplenty_dialog.dart';
import '../../../card/presentation/bloc/card_bloc.dart';
import '../../../card/presentation/provider/card_provider.dart';

class PaymentSettings2 extends StatefulWidget {
  const PaymentSettings2({Key? key}) : super(key: key);

  @override
  _PaymentSettings2State createState() => _PaymentSettings2State();
}

class _PaymentSettings2State extends State<PaymentSettings2> {
  final _bloc = CardBloc(inject());
  final _loadingKey = GlobalKey<FormState>();

  getListOfCards() =>
      Provider.of<CardProvider>(context, listen: false).getAllCards();
  @override
  void initState() {
    getListOfCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getListOfCards();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: defaultAppBar2(context,
          title: 'Payout Settings',
          centerTitle: true,
          showClearButton: false,
          leadingWidget: IconButton(
              onPressed: () => PageRouter.goBack(context),
              icon: Icon(
                Icons.arrow_back,
                color: Pallets.white,
              )),
          textColor: Pallets.white),
      body: BlocListener<CardBloc, CardState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is CardLoadingState) {
            WorkPlenty.showLoading(context, _loadingKey, '');
          }
          if (state is CardRemoveSuccessState) {
            WorkPlenty.hideLoading(_loadingKey);
            WorkPlenty.success('Successfully remove card');

            getListOfCards();
            // PageRouter.goBack(context);
          }
          if (state is CardFailedState) {
            WorkPlenty.hideLoading(_loadingKey);
            WorkPlenty.error(state.message);
          }
        },
        child: Consumer<CardProvider>(
          builder: ((context, value, child) {
            if (value.cardData == null) {
              return Center(
                child: SpinKitCubeGrid(
                  color: Pallets.primary100,
                  size: 50.0,
                ),
              );
            }

            return BodyWidget(
              child: Stack(
                children: [
                  ListView(
                    children: [
                      ...value.cardData!
                          .map((e) => widgetContainer(
                              cardType: e.type,
                              date:
                                  '${e.expiryMonth ?? ''}/${e.expiryYear ?? ''}',
                              firstDigit: e.firstDigits,
                              name: e.name,
                              voidCallback: () =>
                                  _removeCard(context, id: e.id.toString())))
                          .toList()
                    ],
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  void _removeCard(BuildContext context, {String? id}) {
    _bloc.add(StartCardRemoveEvent(CardEntity(id: id)));
  }

  widgetContainer(
          {String? cardType,
          String? firstDigit,
          String? date,
          String? name,
          VoidCallback? voidCallback}) =>
      GestureDetector(
        onTap: () => PageRouter.gotoWidget(PaymentSetting3(), context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ReviewBgCard(
            Container(
              padding: EdgeInsets.all(16.w),
              color: Pallets.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ImageLoader(
                    path: AppImages.master,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: firstDigit!.substring(0, 1) == '5'
                              ? 'Master Card Debit(${firstDigit})'
                              : '${cardType ?? ''}(${firstDigit})',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        SizedBox(
                          height: 3.5.h,
                        ),
                        TextView(
                          text: date ?? '',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        SizedBox(
                          height: 3.5.h,
                        ),
                        TextView(
                          text: name ?? '',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: voidCallback,
                      icon: Icon(
                        Icons.delete_outline,
                        color: Pallets.red600,
                      ))
                ],
              ),
            ),
          ),
        ),
      );
}
