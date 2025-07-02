import 'package:flutter/material.dart';
import 'package:tonnsour/utils/constants.dart';

class EditToCall extends StatelessWidget {
  const EditToCall({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
      child: Row(
        children: [
          // The empty circle
          Container(
            width: 15.0,
            height: 15.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: kWhite)),
          ),
          const SizedBox(
            width: 10.0,
          ),
          // The tocall text
          Text(
            name,
            style: const TextStyle(
                color: kWhite,
                fontFamily: kPoppins,
                fontSize: 18.0,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
