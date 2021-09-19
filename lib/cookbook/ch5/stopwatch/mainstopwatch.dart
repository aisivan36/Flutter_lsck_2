import 'package:flutter/material.dart';
import 'package:lsck/cookbook/ch5/stopwatch/login_screen.dart';
import 'package:lsck/cookbook/ch5/stopwatch/stopwatchapp.dart';

class MainStopWatch extends StatelessWidget {
  const MainStopWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const LoginScreen(),
        StopWatchApp.route: (context) => const StopWatchApp()
      },
      initialRoute: '/',
      // home: LoginScreen(),
    );
  }
}
