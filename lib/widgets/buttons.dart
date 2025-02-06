import 'package:flutter/material.dart';

/// Buttons left and Right.

class ButtonsLeftRight extends StatelessWidget {
  const ButtonsLeftRight(
      {super.key,
      required this.buttonsEnable,
      required this.moveToLeft,
      required this.moveToRight,
      required this.goToLeft});
  final bool buttonsEnable;
  final VoidCallback moveToLeft;
  final VoidCallback moveToRight;
  final bool? goToLeft;

  @override
  Widget build(BuildContext context) {
    bool notActiveLeftButton() => buttonsEnable && goToLeft != true;
    bool notActiveRightButton() => buttonsEnable && goToLeft != false;
    return Row(
      children: [
        ElevatedButton(
          /// While the square is moving, the function moveToLeft cannot execute.
          onPressed: buttonsEnable ? moveToLeft : () {},

          /// If the button is not active, the background is gray.
          style: ElevatedButton.styleFrom(backgroundColor: notActiveLeftButton() ? null : Colors.grey),
          child: const Text('Left'),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          /// While the square is moving, the function moveToRight cannot execute.
          onPressed: buttonsEnable ? moveToRight : () {},

          /// If the button is not active, the background is gray.
          style: ElevatedButton.styleFrom(backgroundColor: notActiveRightButton() ? null : Colors.grey),
          child: const Text('Right'),
        ),
      ],
    );
  }
}
