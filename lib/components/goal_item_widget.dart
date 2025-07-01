import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tonnsour/models/edition/edit_goal.dart';
import 'package:tonnsour/models/goal.dart';
import 'package:tonnsour/utils/constants.dart';

class GoalWidget extends StatelessWidget {
  const GoalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> goals = [
      const Goal(id: 1, name: 'Goal to do'),
      const Goal(id: 2, name: 'Goal to do'),
      const Goal(id: 3, name: 'Goal to do'),
      const Goal(id: 4, name: 'Goal to do')
    ];

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
                            children: const [
                              EditGoal(id: 1, name: '...'),
                              EditGoal(id: 2, name: '...'),
                              EditGoal(id: 3, name: '...'),
                              EditGoal(id: 4, name: '...'),
                              EditGoal(id: 5, name: '...')
                            ],
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
        margin: const EdgeInsets.only(left: 16.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: kBlue, borderRadius: BorderRadius.circular(40.0)),
        child: Column(
          children: const [
            _TitleContainer(
              height: 30.0,
              fontSize: 15.0,
            ),
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
        'Goals',
        style: TextStyle(
            fontSize: fontSize,
            fontFamily: kPoppins,
            color: kRed,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
