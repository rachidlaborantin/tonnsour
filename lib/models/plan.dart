import 'package:flutter/material.dart';
import 'package:tonnsour/utils/constants.dart';

/// It's an element for the morning or evening element
class Plan extends StatelessWidget {
  const Plan(
      {super.key,
      required this.hourAndPlan,
      required this.backgroundColor,
      required this.planDone});
  final String hourAndPlan;
  final Color backgroundColor;
  final bool planDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30.0,
      margin: const EdgeInsets.only(top: 5.0, left: 25.0, right: 25.0),
      padding: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0), color: backgroundColor),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          hourAndPlan,
          style: const TextStyle(
              color: kWhite,
              fontFamily: kPoppins,
              fontSize: 15.0,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
