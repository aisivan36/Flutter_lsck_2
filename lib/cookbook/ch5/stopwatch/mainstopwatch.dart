import 'package:flutter/material.dart';
import 'package:lsck/cookbook/ch5/stopwatch/stopwatchapp.dart';

class MainStopWatch extends StatelessWidget {
  const MainStopWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StopWatchApp(),
    );
  }
}
