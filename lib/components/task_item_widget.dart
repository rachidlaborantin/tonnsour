import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tonnsour/models/task.dart';
import 'package:tonnsour/utils/constants.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      margin: const EdgeInsets.only(right: 16.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: kBlue, borderRadius: BorderRadius.circular(40.0)),
      child: Column(
        children: [
          _TitleContainer(),
          const Task(id: 1, name: "Task 1"),
          const Task(id: 2, name: "Task 2"),
          const Task(id: 3, name: "Task 3"),
          const Task(id: 4, name: "Task 4")
        ],
      ),
    );
  }
}

class _TitleContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30.0,
      margin: const EdgeInsets.only(left: 20.0, top: 15.0, right: 20.0),
      decoration: BoxDecoration(
          color: kWhite, borderRadius: BorderRadius.circular(50.0)),
      alignment: Alignment.center,
      child: const Text(
        'Tasks',
        style: TextStyle(
            fontSize: 15.0,
            fontFamily: kPoppins,
            color: kRed,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
