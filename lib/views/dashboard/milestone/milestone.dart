import 'package:client/views/widgets/review_bg_card.dart';
import 'package:client/views/widgets/text_views.dart';
import 'package:flutter/material.dart';

import '../../../core/helper/routes/navigation.dart';
import '../../../core/helper/utils/pallets.dart';
import '../../widgets/default_appbar.dart';

class Milestone extends StatefulWidget {
  Milestone({Key? key}) : super(key: key);

  @override
  State<Milestone> createState() => _MilestoneState();
}

class _MilestoneState extends State<Milestone> {
  int currentStep = 0;

  List<Step> myStep = [
    Step(
      title: TextView(
        text: 'Setting up User Research',
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      content: TextView(text: ''),
      subtitle: TextView(
        text:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar adipiscing sagittis egestas viverra co....',
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Pallets.grey,
      ),
    ),
    Step(
      title: TextView(
        text: 'Setting up User Research',
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      content: TextView(text: ''),
      subtitle: TextView(
        text:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar adipiscing sagittis egestas viverra co....',
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Pallets.grey,
      ),
    ),
    Step(
      title: TextView(
        text: 'Setting up User Research',
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      content: TextView(text: ''),
      subtitle: TextView(
        text:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar adipiscing sagittis egestas viverra co....',
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Pallets.grey,
      ),
    ),
    Step(
      title: TextView(
        text: 'Setting up User Research',
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      content: TextView(text: ''),
      subtitle: TextView(
        text:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar adipiscing sagittis egestas viverra co....',
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Pallets.grey,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar2(context,
          leadingWidget: IconButton(
            color: Pallets.white,
            icon: Icon(Icons.arrow_back),
            onPressed: () => PageRouter.goBack(context),
          ),
          textColor: Pallets.white,
          centerTitle: true,
          title: 'Milestone'),
      body: ListView(
        children: [
          ReviewBgCard(Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: 'UI Redesign for Web Application',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 8,
                ),
                TextView(
                  text: 'IN PROGRESS | 2/4',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Pallets.grey,
                ),
              ],
            ),
          )),
          SizedBox(
            height: 16,
          ),
          ReviewBgCard(Container(
            child: Stepper(
              currentStep: this.currentStep,
              steps: myStep,
              type: StepperType.vertical,
              // onStepTapped: (step) {
              //   setState(() {
              //     currentStep = step;
              //   });
              // },
              // onStepCancel: () {
              //   setState(() {
              //     if (currentStep > 0) {
              //       currentStep = currentStep - 1;
              //     } else {
              //       currentStep = 0;
              //     }
              //   });
              // },
              // onStepContinue: () {
              //   setState(() {
              //     if (currentStep < myStep.length - 1) {
              //       currentStep = currentStep + 1;
              //     } else {
              //       currentStep = 0;
              //     }
              //   });
              // },
            ),
          )),
        ],
      ),
    );
  }
}
