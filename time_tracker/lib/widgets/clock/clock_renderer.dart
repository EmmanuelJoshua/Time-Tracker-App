import 'dart:math';

import 'package:flutter/material.dart';
import 'package:time_tracker/utils/utils.dart';

import 'clock_hand.dart';
import 'clock_markers.dart';

class ClockRenderer extends StatelessWidget {
  const ClockRenderer({
    Key? key,
    required this.elapsed,
  }) : super(key: key);
  final Duration elapsed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: LayoutBuilder(builder: (context, constraints) {
        final radius = constraints.maxWidth / 2;
        return AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: [
              for (int i = 0; i < 60; i++)
                Positioned(
                  left: radius,
                  top: radius,
                  child: ClockSecondsTickMarker(seconds: i, radius: radius),
                ),
              Positioned(
                left: radius,
                top: radius,
                child: ClockHand(
                  rotationAngleZ:
                      pi + (2 * pi / 60000) * elapsed.inMilliseconds,
                  handThickness: 2,
                  handLength: radius,
                  color: kOrange,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
