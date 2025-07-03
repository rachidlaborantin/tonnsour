import 'package:flutter/material.dart';
import 'package:tonnsour/utils/constants.dart';

/// It's an element for the morning or evening element
class PlanElement extends StatelessWidget {
  const PlanElement(
      {super.key,
      required this.id,
      required this.timePassed,
      required this.hour,
      required this.plan});
  final int id;
  final String hour;
  final bool timePassed;
  final String plan;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
        color: timePassed ? kWhite : kBlue,
        fontFamily: kPoppins,
        fontSize: 15.0,
        fontWeight: FontWeight.w500);

    return Container(
      width: double.infinity,
      height: 30.0,
      margin: const EdgeInsets.only(top: 5.0, left: 25.0, right: 25.0),
      padding: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: timePassed ? kRed : kWhite),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Text(
              hour,
              style: textStyle,
            ),
            const SizedBox(width: 6.0),
            // Bullpoint separator
            Container(
                width: 6.0,
                height: 6.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: timePassed ? kWhite : kBlue,
                )),
            const SizedBox(width: 6.0),
            Text(plan, style: textStyle)
          ],
        ),
      ),
    );
  }
}
