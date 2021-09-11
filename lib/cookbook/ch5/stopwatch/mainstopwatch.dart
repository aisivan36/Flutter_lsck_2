import 'package:flutter/material.dart';
import 'stopwatchapp.dart';

class MainStopWatch extends StatelessWidget {
  const MainStopWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StopWatchApp(),
    );
  }
}
