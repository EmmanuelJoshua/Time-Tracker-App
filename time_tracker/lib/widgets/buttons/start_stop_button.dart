import 'package:flutter/material.dart';
import 'package:time_tracker/utils/colors.dart';

class StartStopButton extends StatelessWidget {
  const StartStopButton({Key? key, required this.isRunning, this.onPressed})
      : super(key: key);
  final bool isRunning;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          isRunning ? 'STOP' : 'START',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kOrange,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
