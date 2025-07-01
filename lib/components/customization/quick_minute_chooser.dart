import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tonnsour/utils/constants.dart';

class QuickMinuteChooser extends StatefulWidget {
  final ValueChanged<int> minuteSelectionListener;
  final String dialogMessage;
  const QuickMinuteChooser(
      {super.key,
      required this.minuteSelectionListener,
      required this.dialogMessage});

  @override
  State<QuickMinuteChooser> createState() => _QuickMinuteChooserState();
}

class _QuickMinuteChooserState extends State<QuickMinuteChooser> {
  int selectedMinute = 0;
  final List<int> minutes = [0, 15, 30, 45];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.dialogMessage,
        style: const TextStyle(
            color: kBlue, fontFamily: kPoppins, fontWeight: FontWeight.w800),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //  Minutes selection
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: minutes.map((minute) {
              String minuteFormatted = minute.toString().padLeft(2, '0');
              return FilterChip(
                  backgroundColor: kBlue,
                  selectedColor: kRed,
                  checkmarkColor: kWhite,
                  label: Text('$minuteFormatted min'),
                  labelStyle: const TextStyle(
                      color: kWhite,
                      fontFamily: kPoppins,
                      fontWeight: FontWeight.w500),
                  selected: minute == selectedMinute,
                  onSelected: (_) {
                    setState(() {
                      selectedMinute = minute;
                    });
                  });
            }).toList(),
          )
        ],
      ),

      // Box actions
      actions: [
        TextButton(
            onPressed: () {
              widget.minuteSelectionListener(selectedMinute);
            },
            child: const Text(
              'Confirm',
              style: TextStyle(
                  color: kBlue,
                  fontFamily: kPoppins,
                  fontWeight: FontWeight.w800),
            ))
      ],
    );
  }
}
