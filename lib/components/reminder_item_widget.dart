import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tonnsour/utils/constants.dart';

class ReminderWidget extends StatelessWidget {
  const ReminderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      margin: const EdgeInsets.only(left: 16.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: kBlue, borderRadius: BorderRadius.circular(30.0)),
      child: Column(
        children: [_TitleContainer()],
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
      margin: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
      decoration: BoxDecoration(
          color: kWhite, borderRadius: BorderRadius.circular(50.0)),
      alignment: Alignment.center,
      child: const Text(
        'Reminder',
        style: TextStyle(
            fontSize: 15.0,
            fontFamily: kPoppins,
            color: kRed,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
