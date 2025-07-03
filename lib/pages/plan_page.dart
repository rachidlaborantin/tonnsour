import 'package:flutter/material.dart';
import 'package:tonnsour/components/evening_widget.dart';
import 'package:tonnsour/components/goal_item_widget.dart';
import 'package:tonnsour/components/header_widget.dart';
import 'package:tonnsour/components/reminder_item_widget.dart';
import 'package:tonnsour/components/task_item_widget.dart';
import 'package:tonnsour/components/tocall_item_widget.dart';
import 'package:tonnsour/components/morning_widget.dart';

import '../utils/constants.dart';
import '../utils/helpers.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({super.key});

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  String _dayStartTime = '0:00';
  final String _morningEndTime = '12:00';
  final String _eveningStartTime = '13:00';
  String _dayEndTime = '22:00';

  Future<void> _loadPDatas() async {
    final savedStartTime = await Helpers.getStringPref(kDayStartTime);
    if (savedStartTime != null) {
      setState(() {
        _dayStartTime = savedStartTime;
      });
    }
    final savedEndTime = await Helpers.getStringPref(kDayEndTime);
    if (savedEndTime != null) {
      setState(() {
        _dayEndTime = savedEndTime;
      });
    }

    /*
   Load the times between day start and morning end to determine
   the morning interval
   */
    final List<String> morningHours = Helpers.generateTimeRange(
        startTime: _dayStartTime, endTime: _morningEndTime);

    /*
   Load the times between evening start and day end to determine
   the evening interval
   */
    final List<String> eveningHours = Helpers.generateTimeRange(
        startTime: _eveningStartTime, endTime: _dayEndTime);

    //And generate the day with prefilled plans
    Helpers().addNewDay(morningHours, eveningHours);
  }

  @override
  void initState() {
    super.initState();
    _loadPDatas();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Header line
            const HeaderWidget(),
            const SizedBox(
              height: 16.0,
            ),
            const Expanded(child: MorningWidget()),
            const SizedBox(
              height: 8.0,
            ),
            const Expanded(child: EveningWidget()),
            const SizedBox(
              height: 16.0,
            ),
            // Goals and tasks line
            Row(
              children: const [
                Expanded(child: GoalWidget()),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(child: TaskWidget())
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            // Reminder and toCall line
            Row(
              children: const [
                Expanded(child: ReminderWidget()),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(child: ToCallWidget())
              ],
            ),
            // Bottom space
            const SizedBox(
              height: 4.0,
            ),
          ],
        ),
      ),
    );
  }
}
