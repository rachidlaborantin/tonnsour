import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tonnsour/models/goal.dart';
import 'package:tonnsour/utils/constants.dart';

class GoalWidget extends StatelessWidget {
  const GoalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      margin: const EdgeInsets.only(left: 16.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: kBlue, borderRadius: BorderRadius.circular(40.0)),
      child: Column(
        children: [
          _TitleContainer(),
          const Goal(id: 1, name: 'Goal to do'),
          const Goal(id: 2, name: 'Goal to do'),
          const Goal(id: 3, name: 'Goal to do'),
          const Goal(id: 4, name: 'Goal to do')
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
      margin: const EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
      decoration: BoxDecoration(
          color: kWhite, borderRadius: BorderRadius.circular(50.0)),
      alignment: Alignment.center,
      child: const Text(
        'Goals',
        style: TextStyle(
            fontSize: 15.0,
            fontFamily: kPoppins,
            color: kRed,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
