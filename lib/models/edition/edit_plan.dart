import 'package:flutter/material.dart';
import 'package:tonnsour/models/edition/editable_plan.dart';
import 'package:tonnsour/utils/constants.dart';
import 'package:tonnsour/utils/helpers.dart';

import 'editable_hour.dart';

/// It's an element for the morning or evening element
class EditPlan extends StatelessWidget {
  const EditPlan(
      {super.key,
      required this.backgroundColor,
      required this.timePassed,
      required this.hour,
      required this.plan,
      required this.isTimeEditable});
  final String hour;
  final String plan;
  final Color backgroundColor;
  final bool timePassed;
  final bool isTimeEditable;

  @override
  Widget build(BuildContext context) {
    var bgColor = Helpers.isTimePassed(hour) ? kRed : kWhite;
    var styleColor = Helpers.isTimePassed(hour) ? kWhite : kBlue;

    var textStyle = TextStyle(
        color: styleColor,
        fontFamily: kPoppins,
        fontSize: 18.0,
        fontWeight: FontWeight.w500);

    return Container(
      width: double.infinity,
      height: 50.0,
      margin: const EdgeInsets.only(top: 5.0, left: 25.0, right: 25.0),
      padding: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0), color: bgColor),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            !timePassed
                ? EditableHour(
                    initialText: '',
                    fixedHour: hour,
                    timePassed: timePassed,
                    isTimeEditable: isTimeEditable,
                  )
                : Text(
                    hour,
                    style: textStyle,
                  ),
            const SizedBox(width: 8.0),
            // Bullpoint separator
            Container(
                width: 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: styleColor,
                )),
            const SizedBox(width: 8.0),
            EditablePlan(initialText: '...', timePassed: timePassed)
          ],
        ),
      ),
    );
  }
}
