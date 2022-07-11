import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:time_tracker/utils/utils.dart';
import 'package:time_tracker/widgets/widgets.dart';

class TimeTracker extends StatefulWidget {
  const TimeTracker({Key? key}) : super(key: key);

  @override
  _TimeTrackerState createState() => _TimeTrackerState();
}

class _TimeTrackerState extends State<TimeTracker>
    with SingleTickerProviderStateMixin {
  Duration _previouslyElapsed = Duration.zero;
  Duration _currentElapsed = Duration.zero;
  Duration get _elapsed => _previouslyElapsed + _currentElapsed;
  late final Ticker _ticker;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();

    _ticker = createTicker((elapsed) {
      setState(() {
        _currentElapsed = elapsed;
      });
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _toggleRunning() {
    setState(() {
      _isRunning = !_isRunning;
      if (_isRunning) {
        _ticker.start();
      } else {
        _ticker.stop();
        _previouslyElapsed += _currentElapsed;
        _currentElapsed = Duration.zero;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          const Gap(35),
          ClockRenderer(
            elapsed: _elapsed,
          ),
          const Gap(70),
          ElapsedTimeText(
            elapsed: _elapsed,
          ),
          const Gap(40),
          StartStopButton(
            isRunning: _isRunning,
            onPressed: _toggleRunning,
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        height: MediaQuery.of(context).size.height / 4,
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              30,
            ),
            topRight: Radius.circular(
              30,
            ),
          ),
        ),
        width: double.infinity,
      ),
    );
  }
}
