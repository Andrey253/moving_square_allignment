import 'package:flutter/material.dart';

/// AnimatedContainer

class AnimatedContainerCustom extends StatelessWidget {
  const AnimatedContainerCustom({super.key, required this.aligmentX, required this.onEndAnimation});
final double Function() aligmentX;
final VoidCallback onEndAnimation;

  /// Square size.
  static const _squareSize = 50.0;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
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
        );
  }
}