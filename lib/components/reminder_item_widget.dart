import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:tonnsour/components/elements/reminder_e.dart';
import 'package:tonnsour/utils/constants.dart';

import '../utils/day_datas.dart';
import '../utils/services/days_service.dart';
import 'elements/edition/edit_reminder.dart';

class ReminderWidget extends StatefulWidget {
  const ReminderWidget({super.key});

  @override
  State<ReminderWidget> createState() => _ReminderWidgetState();
}

class _ReminderWidgetState extends State<ReminderWidget> {
  late DayDatas _dayDatas;
  bool _isLoading = true;

  Future<void> _loadPDatas() async {
    _dayDatas = await DaysService().loadDay(DateTime(2025, 7, 14), kMorning);
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

    final _reminders = _dayDatas.reminders.map((reminder) {
      return EditReminder(
        id: reminder.id,
        name: reminder.name,
      );
    }).toList();

    void _showEditGoalDialog(BuildContext context) {
      showDialog(
          context: context,
          builder: (_) => Dialog(
                insetPadding: const EdgeInsets.all(20.0),
                backgroundColor: Colors.transparent,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
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
                          child: Column(children: _reminders),
                        ),
                      )
                    ],
                  ),
                ),
              ));
    }

    return GestureDetector(
      onTap: () => _showEditGoalDialog(context),
      child: Container(
        height: 150.0,
        margin: const EdgeInsets.only(left: 16.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: kRed, borderRadius: BorderRadius.circular(30.0)),
        child: Column(
          children: [
            const _TitleContainer(
              height: 30.0,
              fontSize: 15.0,
            ),
            ..._reminders
                .take(3)
                .map((reminder) => ReminderElement(name: reminder.name))
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
        'Reminder',
        style: TextStyle(
            fontSize: fontSize,
            fontFamily: kPoppins,
            color: kRed,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
