import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:tonnsour/components/elements/plan_e.dart';
import 'package:tonnsour/utils/constants.dart';
import 'package:tonnsour/utils/day_datas.dart';

import '../utils/helpers.dart';
import '../utils/services/days_service.dart';
import '../utils/services/plans_service.dart';
import 'elements/edition/edit_plan.dart';

class EveningWidget extends StatefulWidget {
  const EveningWidget({super.key});

  @override
  State<EveningWidget> createState() => _EveningWidgetState();
}

class _EveningWidgetState extends State<EveningWidget> {
  late DayDatas _dayDatas;
  bool _isLoading = true;

  Future<void> _loadPDatas() async {
    _dayDatas = await DaysService().loadDay(DateTime(2025, 7, 14), kEvening);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPDatas();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SizedBox(
        width: 25.0,
        height: 25.0,
        child: LoadingIndicator(
          indicatorType: Indicator.lineSpinFadeLoader,
          colors: [kBlue],
          strokeWidth: 3.0,
        ),
      );
    }

    // Load the times between day start and day end
    final _plans = _dayDatas.plans.expand((plan) {
      bool isTimePassed = Helpers.isTimePassed(plan.hour);

      // We update the plan time passage status on showing
      PlansService().updatePlan(planId: plan.id, timePassed: isTimePassed);

      return [
        EditPlan(
          id: plan.id,
          hour: plan.hour,
          plan: plan.plan,
          timePassed: isTimePassed,
          isTimeEditable: plan.isHourEditable,
        )
      ];
    }).toList();

    void _showEditGoalDialog(BuildContext context) {
      showDialog(
          context: context,
          builder: (_) => Dialog(
                insetPadding: const EdgeInsets.all(20.0),
                backgroundColor: Colors.transparent,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: kBlue, borderRadius: BorderRadius.circular(40.0)),
                  child: Column(
                    children: [
                      const _TitleContainer(
                        height: 50.0,
                        fontSize: 20.0,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: _plans,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ));
    }

    // We search for the next not passed hour
    final next = _plans.firstWhere(
      (plan) => !plan.timePassed && !plan.isTimeEditable,
      orElse: () => _plans.lastWhere(
        (plan) => !plan.isTimeEditable,
        orElse: () => _plans.last, // fallback extrême
      ),
    );

    return GestureDetector(
      onTap: () => _showEditGoalDialog(context),
      child: Container(
        height: 200.0,
        margin: const EdgeInsets.only(left: 16.0, right: 16.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: kBlue, borderRadius: BorderRadius.circular(30.0)),
        child: Column(
          children: [
            const _TitleContainer(
              height: 30.0,
              fontSize: 15.0,
            ),
            PlanElement(
                id: next.id,
                timePassed: next.timePassed,
                hour: next.hour,
                plan: next.plan)
          ],
        ),
      ),
    );
  }
}

class _TitleContainer extends StatelessWidget {
  final double height;
  final double fontSize;

  const _TitleContainer(
      {super.key, required this.height, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      margin: const EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
      decoration: BoxDecoration(
          color: kWhite, borderRadius: BorderRadius.circular(50.0)),
      alignment: Alignment.center,
      child: Text(
        'Evening',
        style: TextStyle(
            fontSize: fontSize,
            fontFamily: kPoppins,
            color: kRed,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
