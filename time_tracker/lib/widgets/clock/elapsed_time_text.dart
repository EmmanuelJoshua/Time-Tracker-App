import 'package:flutter/material.dart';
import 'package:time_tracker/utils/utils.dart';

class ElapsedTimeText extends StatelessWidget {
  const ElapsedTimeText({
    Key? key,
    required this.elapsed,
  }) : super(key: key);
  final Duration elapsed;

  @override
  Widget build(BuildContext context) {
    final seconds = elapsed.inSeconds % 60;
    final minutes = elapsed.inMinutes % 60;
    final hours = elapsed.inHours % 24;

    final secondsStr = seconds.toString().padLeft(2, '0');
    final minutesStr = minutes.toString().padLeft(2, '0');
    final hoursStr = hours.toString().padLeft(2, '0');
    const digitWidth = 21.0;

    bool isSecondsActive = (minutes != 0 || seconds != 0);
    bool isMinutesActive = (hours != 0 || minutes != 0);
    bool isHoursActive = hours != 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TimeDigit(
          hoursStr.substring(0, 1),
          width: digitWidth,
          isActive: isHoursActive,
        ),
        TimeDigit(
          hoursStr.substring(1, 2),
          width: digitWidth,
          isActive: isHoursActive,
        ),
        TimeDigit(
          ':',
          width: 8,
          isActive: isMinutesActive,
        ),
        TimeDigit(
          minutesStr.substring(0, 1),
          width: digitWidth,
          isActive: isMinutesActive,
        ),
        TimeDigit(
          minutesStr.substring(1, 2),
          width: digitWidth,
          isActive: isMinutesActive,
        ),
        TimeDigit(
          ':',
          width: 8,
          isActive: isSecondsActive,
        ),
        TimeDigit(
          secondsStr.substring(0, 1),
          width: digitWidth,
          isActive: isSecondsActive,
        ),
        TimeDigit(
          secondsStr.substring(1, 2),
          width: digitWidth,
          isActive: isSecondsActive,
        ),
      ],
    );
  }
}

class TimeDigit extends StatelessWidget {
  const TimeDigit(
    this.text, {
    Key? key,
    required this.width,
    required this.isActive,
  }) : super(key: key);
  final String text;
  final double width;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: isActive ? white : const Color(0xff202226),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
