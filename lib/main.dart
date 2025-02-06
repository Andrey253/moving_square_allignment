import 'package:flutter/material.dart';
import 'package:moving_square_allignment/widgets/anim_container.dart';
import 'package:moving_square_allignment/widgets/buttons.dart';

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
        /// AnimatedContainer
        AnimatedContainerCustom(
          aligmentX: aligmentX,
          onEndAnimation: onEndAnimation,
        ),
        const SizedBox(height: 16),
        /// Buttons left and Right.
        ButtonsLeftRight(
          buttonsEnable: buttonsEnable,
          moveToLeft: moveToLeft,
          moveToRight: moveToRight,
          goToLeft: goToLeft,
        ),
      ],
    );
  }

  /// When [goToLeft] is Null both buttons are active

  /// Set the parameters for moving to the right.
  /// If at the end of the animation, the direction to the left ([goToLeft] == true) is set, then the right button does not perform any actions.
  void moveToRight() => goToLeft == true || goToLeft == null
      ? setState(() {
          if (goToLeft == true || goToLeft == null) buttonsEnable = false;
          goToLeft = false;
        })
      : null;

  /// Set the parameters for moving to the left.
  /// If at the end of the animation, the direction to the right ([goToLeft] == false) is set, then the lrft button does not perform any actions.
  void moveToLeft() => goToLeft == false || goToLeft == null
      ? setState(() {
          if (goToLeft == false || goToLeft == null) buttonsEnable = false;
          goToLeft = true;
        })
      : null;

  /// At the end of the animation, activate the buttons.
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
