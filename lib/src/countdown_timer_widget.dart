import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

class CountdownTimerWidget extends StatefulWidget {
  final int durationMin;
  final Function onEnd;

  const CountdownTimerWidget(
      {Key? key, this.durationMin = 10, required this.onEnd})
      : super(key: key);

  @override
  _CountdownTimerWidgetState createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  late CountdownController countdownController;
  bool isRunning = false;

  void startCountdown() {
    if (!countdownController.isRunning) {
      countdownController.start();
      setState(() {
        isRunning = true;
      });
    }
  }

  void stopCountdown() {
    if (countdownController.isRunning) {
      countdownController.stop();
      setState(() {
        isRunning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Countdown(
            countdownController: countdownController,
            builder: (_, Duration time) {
              return Text(
                  'minutes: ${time.inMinutes % 60} seconds: ${time.inSeconds % 60}');
              // return Text(
              //   'hours--: ${time.inHours} minutes: ${time.inMinutes % 60} seconds: ${time.inSeconds % 60}',
              //   style: TextStyle(fontSize: 20),
              // );
            }),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    countdownController = CountdownController(
        duration: Duration(minutes: widget.durationMin),
        onEnd: () {
          print('-----onEnd---- counter---minutes-- ${widget.durationMin}');
          widget.onEnd();
        });

    startCountdown();
  }

  @override
  void dispose() {
    stopCountdown();
    super.dispose();
  }
}
