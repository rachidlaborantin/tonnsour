import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tonnsour/utils/constants.dart';

class EveningWidget extends StatelessWidget {
  const EveningWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Container(
        width: double.infinity,
        height: 100.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: kBlue, borderRadius: BorderRadius.circular(40.0)),
        child: Column(
          children: [_TitleContainer()],
        ),
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
      margin: const EdgeInsets.only(top: 15.0, left: 25.0, right: 25.0),
      decoration: BoxDecoration(
          color: kWhite, borderRadius: BorderRadius.circular(50.0)),
      alignment: Alignment.center,
      child: const Text(
        'Evening',
        style: TextStyle(
            fontSize: 15.0,
            fontFamily: kPoppins,
            color: kRed,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
