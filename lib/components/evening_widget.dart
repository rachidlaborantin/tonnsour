import 'package:flutter/material.dart';
import 'package:tonnsour/models/edition/edit_plan.dart';
import 'package:tonnsour/models/plan.dart';
import 'package:tonnsour/utils/constants.dart';

import '../utils/helpers.dart';

class EveningWidget extends StatefulWidget {
  const EveningWidget({super.key});

  @override
  State<EveningWidget> createState() => _EveningWidgetState();
}

class _EveningWidgetState extends State<EveningWidget> {
  final String _dayStartTime = '13:00';
  String _dayEndTime = '22:00';

  Future<void> _loadPDatas() async {
    final savedStartTime = await Helpers.getStringPref(kDayEndTime);
    if (savedStartTime != null) {
      setState(() {
        _dayEndTime = savedStartTime;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadPDatas();
  }

  @override
  Widget build(BuildContext context) {
    // Load the times between day start and day end
    final List<String> hours = Helpers.generateTimeRange(
        dayStartTime: _dayStartTime,
        dayEndTime: _dayEndTime,
        step: const Duration(minutes: 30));
    final _plans = hours.expand((hour) {
      final hourSole = hour.split(':')[0].padLeft(2, '0');
      bool isTimePassed = Helpers.isTimePassed(hour);

      return [
        EditPlan(
          hour: hour,
          plan: '...',
          backgroundColor: kRed,
          timePassed: isTimePassed,
          isTimeEditable: false,
        ),
        EditPlan(
          hour: hourSole,
          plan: '...',
          backgroundColor: kRed,
          timePassed: isTimePassed,
          isTimeEditable: true,
        ),
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
            Plan(timePassed: next.timePassed, hour: next.hour, plan: next.plan)
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
