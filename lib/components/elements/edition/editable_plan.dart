import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

/// To create a line of goal which will be editable on long press
class EditablePlan extends StatefulWidget {
  final String initialText;
  final bool timePassed;
  final void Function(String)? onSubmitted;
  const EditablePlan(
      {super.key,
      required this.initialText,
      this.onSubmitted,
      required this.timePassed});

  @override
  State<EditablePlan> createState() => _EditablePlanState();
}

class _EditablePlanState extends State<EditablePlan> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
  }

  void _startEditing() {
    setState(() {});
    _focusNode.requestFocus();
  }

  void _submit() {
    setState(() {});
    widget.onSubmitted?.call(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: widget.timePassed ? kWhite : kBlue,
      fontFamily: kPoppins,
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
    );

    return GestureDetector(
        onLongPress: _startEditing,
        child: !widget.timePassed
            ? SizedBox(
                width: 200.0,
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  onSubmitted: (_) => _submit(),
                  style: textStyle,
                  decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none),
                ),
              )
            : Text.rich(TextSpan(
                text: _controller.text,
                style: textStyle,
              )));
  }
}
