import 'package:flutter/material.dart';
import 'package:tonnsour/models/plan.dart';
import 'package:tonnsour/utils/constants.dart';

class MorningWidget extends StatelessWidget {
  const MorningWidget({super.key});

  final hourAndPlan = '3:30 • Wakeup and wuduu';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        children: [
          // Title container
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: kBlue, borderRadius: BorderRadius.circular(40.0)),
            child: Column(
              children: [
                _TitleContainer(),
                Plan(
                    hourAndPlan: hourAndPlan,
                    backgroundColor: kRed,
                    planDone: true),
                Plan(
                    hourAndPlan: hourAndPlan,
                    backgroundColor: kRed,
                    planDone: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TitleContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30.0,
      margin: const EdgeInsets.only(top: 15.0, left: 25.0, right: 25.0),
      decoration: BoxDecoration(
          color: kWhite, borderRadius: BorderRadius.circular(50.0)),
      alignment: Alignment.center,
      child: const Text(
        'Morning',
        style: TextStyle(
            fontSize: 15.0,
            fontFamily: kPoppins,
            color: kRed,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
