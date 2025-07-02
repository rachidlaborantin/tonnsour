import 'package:flutter/material.dart';
import 'package:tonnsour/utils/constants.dart';

class Task extends StatelessWidget {
  const Task({super.key, required this.id, required this.name});
  final int id;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Row(
        children: [
          _GoalIdContainer(id: id),
          const SizedBox(
            width: 5.0,
          ),
          Text(
            name,
            style: const TextStyle(
                color: kWhite,
                fontFamily: kPoppins,
                fontSize: 15.0,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

class _GoalIdContainer extends StatelessWidget {
  const _GoalIdContainer({super.key, required this.id});
  final int id;

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
          id.toString(),
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
