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
          const ButtonRow(),
          const Gap(30),
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
        padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
        height: MediaQuery.of(context).size.height / 3.8,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'TODAY',
                  style: TextStyle(
                    color: Color(0xff36383c),
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '12 July - 01:25:36',
                  style: TextStyle(
                    color: Color(0xffc6c6c6),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffb9f3ed)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      child: const Center(
                        child: Text(
                          'Personal',
                          style: TextStyle(
                            color: Color(0xff6baca6),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Gap(9),
                    Text(
                      'Add description...',
                      style: TextStyle(
                        color: const Color(0xff6baca6).withOpacity(0.7),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '00:25:35',
                      style: TextStyle(
                        fontSize: 27.5,
                        fontWeight: FontWeight.bold,
                        color: black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(2),
                    Text(
                      '3:15PM - 3:40PM',
                      style: TextStyle(
                        color: const Color(0xff6baca6).withOpacity(0.7),
                        fontSize: 15.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffc4c8f4)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      child: const Center(
                        child: Text(
                          'Home',
                          style: TextStyle(
                            color: Color(0xff8084bb),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Gap(9),
                    Text(
                      'Add description...',
                      style: TextStyle(
                        color: const Color(0xff6baca6).withOpacity(0.7),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '00:10:35',
                      style: TextStyle(
                        fontSize: 27.5,
                        fontWeight: FontWeight.bold,
                        color: black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(2),
                    Text(
                      '2:30PM - 2:40PM',
                      style: TextStyle(
                        color: const Color(0xff6baca6).withOpacity(0.7),
                        fontSize: 15.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
