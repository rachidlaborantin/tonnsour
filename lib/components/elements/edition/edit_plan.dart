import 'package:flutter/material.dart';
import 'package:tonnsour/models/plan.dart';
import 'package:tonnsour/utils/constants.dart';
import 'package:tonnsour/utils/helpers.dart';
import 'package:tonnsour/utils/services/plans_service.dart';

import 'editable_hour.dart';
import 'editable_plan.dart';

/// It's an element for the morning or evening element
class EditPlan extends StatefulWidget {
  const EditPlan(
      {super.key,
      required this.id,
      required this.timePassed,
      required this.hour,
      required this.plan,
      required this.isTimeEditable});
  final int id;
  final String hour;
  final String plan;
  final bool timePassed;
  final bool isTimeEditable;

  @override
  State<EditPlan> createState() => _EditPlanState();
}

class _EditPlanState extends State<EditPlan> {
  late String _name;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _name = widget.plan;
    _controller.text = _name;
  }

  void _updateThePlanHour(String newHour) {
    Plan updatedPlan = Plan();
    updatedPlan.hour = newHour;
    PlansService().updatePlan(planId: widget.id, newHour: newHour);
  }

  void _updateThePlan(String planName) {
    Plan updatedPlan = Plan();
    updatedPlan.plan = planName;
    PlansService().updatePlan(planId: widget.id, newPlan: planName);
  }

  @override
  Widget build(BuildContext context) {
    var bgColor = Helpers.isTimePassed(widget.hour) ? kRed : kWhite;
    var styleColor = Helpers.isTimePassed(widget.hour) ? kWhite : kBlue;

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
            !widget.timePassed
                ? EditableHour(
                    initialText: '',
                    fixedHour: widget.hour,
                    timePassed: widget.timePassed,
                    isTimeEditable: widget.isTimeEditable,
                    onSubmitted: (newHour) {
                      _updateThePlanHour(newHour);
                    },
                  )
                : Text(
                    widget.hour,
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
            EditablePlan(
              initialText: _name,
              timePassed: widget.timePassed,
              onSubmitted: (newPlan) {
                _updateThePlan(newPlan);
              },
            )
          ],
        ),
      ),
    );
  }
}
