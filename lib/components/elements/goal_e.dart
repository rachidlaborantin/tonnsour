import 'package:flutter/material.dart';
import 'package:tonnsour/utils/constants.dart';

class GoalElement extends StatelessWidget {
  const GoalElement(
      {super.key,
      required this.id,
      required this.name,
      required this.number,
      required this.isDone});
  final int id;
  final String name;
  final int number;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Row(
        children: [
          _GoalNumberContainer(number: number),
          const SizedBox(
            width: 5.0,
          ),
          Text(
            name,
            style: TextStyle(
                color: isDone ? kRed : kWhite,
                fontFamily: kPoppins,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                decoration:
                    isDone ? TextDecoration.lineThrough : TextDecoration.none,
                decorationThickness: 2.0),
          )
        ],
      ),
    );
  }
}

class _GoalNumberContainer extends StatelessWidget {
  const _GoalNumberContainer({super.key, required this.number});
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25.0,
      height: 15.0,
      padding: const EdgeInsets.all(2.5),
      decoration:
          BoxDecoration(color: kRed, borderRadius: BorderRadius.circular(20.0)),
      child: Center(
        child: Text(
          number.toString(),
          style: const TextStyle(
              color: kWhite,
              fontFamily: kPoppins,
              fontSize: 10.0,
              fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
