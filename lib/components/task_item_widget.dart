import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:tonnsour/components/elements/task_e.dart';
import 'package:tonnsour/utils/constants.dart';
import 'package:tonnsour/utils/services/tasks_service.dart';

import '../utils/day_datas.dart';
import '../utils/services/days_service.dart';
import 'elements/edition/edit_task.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
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

    int number = 1;
    final _tasks = _dayDatas.tasks.expand((task) {
      // We update the plan time passage status on showing
      TasksService().updateTask(taskId: task.id, isDone: task.isDone);
      return [
        EditTask(
          number: number++,
          id: task.id,
          name: task.name,
          isDone: task.isDone,
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
                          child: Column(
                            children: _tasks,
                          ),
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
        height: 200.0,
        margin: const EdgeInsets.only(right: 16.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: kBlue, borderRadius: BorderRadius.circular(40.0)),
        child: Column(
          children: [
            const _TitleContainer(
              height: 30.0,
              fontSize: 15.0,
            ),
            ..._tasks.map((task) => TaskElement(
                  id: task.id,
                  number: task.number,
                  name: task.name,
                  isDone: task.isDone,
                ))
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
        'Tasks',
        style: TextStyle(
            fontSize: fontSize,
            fontFamily: kPoppins,
            color: kRed,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
