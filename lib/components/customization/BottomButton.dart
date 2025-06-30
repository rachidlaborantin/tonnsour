import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tonnsour/utils/constants.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback callback;
  const BottomButton({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
        child: Container(
          width: 60.0,
          height: 20.0,
          color: kBlue,
          child: TextButton(
            onPressed: callback,
            child: const Icon(
              Icons.menu_rounded,
              size: 20.0,
              color: kWhite,
            ),
          ),
        ),
      ),
    );
  }
}
