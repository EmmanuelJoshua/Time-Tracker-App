import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClockHand extends StatelessWidget {
  const ClockHand({
    Key? key,
    required this.rotationAngleZ,
    required this.handThickness,
    required this.handLength,
    required this.color,
  }) : super(key: key);
  final double rotationAngleZ;
  final double handThickness;
  final double handLength;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()
        ..translate(-handThickness / 2, 0.0, 0.0)
        ..rotateZ(rotationAngleZ),
      child: Container(
        height: handLength,
        width: handThickness,
        color: color,
      ),
    );
  }
}
