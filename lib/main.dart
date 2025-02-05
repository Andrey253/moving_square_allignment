import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Padding(
        padding: EdgeInsets.all(32.0),
        child: SquareAnimation(),
      ),
    );
  }
}

class SquareAnimation extends StatefulWidget {
  const SquareAnimation({super.key});

  @override
  State<SquareAnimation> createState() {
    return SquareAnimationState();
  }
}

class SquareAnimationState extends State<SquareAnimation> {
  /// Square size.
  static const _squareSize = 50.0;

  /// If [goToLeft] equals true then move left.
  /// If [goToLeft] equals false then move right.
  /// If [goToLeft] is null, then square in the center.
  bool? goToLeft;

  ///  While the square is moving, [buttonsEnable] is false.
  /// If [buttonsEnable] is true, then the button is active.
  bool buttonsEnable = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          /// Fumction aligmentX() calculates alignment.
          alignment: Alignment(aligmentX(), 0),
          onEnd: onEndAnimation,
          duration: Duration(seconds: 1),
          child: Container(
            width: _squareSize,
            height: _squareSize,
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            ElevatedButton(
              /// While the square is moving, the function moveToLeft cannot execute.
              onPressed: buttonsEnable ? moveToLeft : () {},

              /// If the button is not active, the background is gray.
              style: ElevatedButton.styleFrom(backgroundColor: buttonsEnable ? null : Colors.grey),
              child: const Text('Left'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              /// While the square is moving, the function moveToRight cannot execute.
              onPressed: buttonsEnable ? moveToRight : () {},

              /// If the button is not active, the background is gray.
              style: ElevatedButton.styleFrom(backgroundColor: buttonsEnable ? null : Colors.grey),
              child: const Text('Right'),
            ),
          ],
        ),
      ],
    );
  }

  /// Set the parameters for moving to the right.
  void moveToRight() => setState(() {
        if (goToLeft == true || goToLeft == null) buttonsEnable = false;
        goToLeft = false;
      });
/// Set the parameters for moving to the left.
  void moveToLeft() => setState(() {
        if (goToLeft == false || goToLeft == null) buttonsEnable = false;
        goToLeft = true;
      });
///At the end of the animation, activate the buttons.
  void onEndAnimation() => setState(() {
        buttonsEnable = true;
      });
  /// Сalculates alignment on x.
  double aligmentX() {
    if (goToLeft == null) return 0;
    if (goToLeft == true) return -1;
    return 1;
  }
}
