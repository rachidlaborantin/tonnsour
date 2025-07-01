import 'package:flutter/material.dart';
import 'package:tonnsour/components/evening_widget.dart';
import 'package:tonnsour/components/header_widget.dart';
import 'package:tonnsour/components/reminder_item_widget.dart';
import 'package:tonnsour/components/task_item_widget.dart';
import 'package:tonnsour/components/tocall_item_widget.dart';
import 'package:tonnsour/components/morning_widget.dart';

class PlannerPage extends StatefulWidget {
  const PlannerPage({super.key});

  @override
  State<PlannerPage> createState() => _PlannerPageState();
}

/*

 */
class _PlannerPageState extends State<PlannerPage> {
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
