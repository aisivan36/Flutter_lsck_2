import 'dart:async';
import 'package:flutter/material.dart';

class StopWatchApp extends StatefulWidget {
  const StopWatchApp({Key? key}) : super(key: key);

  @override
  State<StopWatchApp> createState() => _StopWatchAppState();
}

class _StopWatchAppState extends State<StopWatchApp> {
  late int seconds;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    seconds = 0;
    timer = Timer.periodic(Duration(seconds: 1), _onTick);
  }

  void _onTick(Timer timer) {
    // ++seconds // like this it also works as is
    setState(() {
      ++seconds; // this is an optional you can add it above this setState
    });
  }

  String _secondsText() => seconds == 1 ? 'second' : 'seconds';

  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StopWatchApp'),
      ),
      body: Center(
        child: Text(
          '$seconds ${_secondsText()}',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
