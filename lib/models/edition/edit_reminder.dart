import 'package:flutter/material.dart';
import 'package:tonnsour/utils/constants.dart';

class EditReminder extends StatelessWidget {
  const EditReminder({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Row(
        children: [
          // The empty circle
          Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: kWhite)),
          ),
          const SizedBox(
            width: 10.0,
          ),
          // The reminder text
          Text(
            name,
            style: const TextStyle(
                color: kWhite,
                fontFamily: kPoppins,
                fontSize: 12.0,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
