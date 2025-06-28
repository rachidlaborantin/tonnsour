import 'package:flutter/material.dart';
import 'package:tonnsour/components/customization/quick_time_chooser.dart';
import 'package:tonnsour/components/evening_widget.dart';
import 'package:tonnsour/components/goal_item_widget.dart';
import 'package:tonnsour/components/header_widget.dart';
import 'package:tonnsour/components/reminder_item_widget.dart';
import 'package:tonnsour/components/task_item_widget.dart';
import 'package:tonnsour/components/tocall_item_widget.dart';
import 'package:tonnsour/utils/constants.dart';
import 'package:tonnsour/components/morning_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/*
return SafeArea(
      child: Scaffold(
        backgroundColor: kWhite,
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
              height: 16.0,
            )
          ],
        ),
      ),
    );
 */
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return QuickTimeChooser(timeSelectionListener: (time) {
      print('Heure séléctionnée : ${time.format(context)}');
    });
  }
}
