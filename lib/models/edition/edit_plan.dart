import 'package:flutter/material.dart';
import 'package:tonnsour/utils/constants.dart';

/// It's an element for the morning or evening element
class EditPlan extends StatelessWidget {
  const EditPlan(
      {super.key,
      required this.backgroundColor,
      required this.planDone,
      required this.hour,
      required this.hourEditable,
      required this.plan});
  final String hour;
  final bool hourEditable;
  final String plan;
  final Color backgroundColor;
  final bool planDone;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        color: kWhite,
        fontFamily: kPoppins,
        fontSize: 18.0,
        fontWeight: FontWeight.w500);

    return Container(
      width: double.infinity,
      height: 50.0,
      margin: const EdgeInsets.only(top: 5.0, left: 25.0, right: 25.0),
      padding: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0), color: backgroundColor),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Text(
              hour,
              style: textStyle,
            ),
            const SizedBox(width: 8.0),
            // Bullpoint separator
            Container(
                width: 8.0,
                height: 8.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kWhite,
                )),
            const SizedBox(width: 8.0),
            Text(plan, style: textStyle)
          ],
        ),
      ),
    );
  }
}
