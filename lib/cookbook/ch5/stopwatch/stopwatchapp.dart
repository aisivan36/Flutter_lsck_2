import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:flutter_dialogs/flutter_dialogs.dart';

class StopWatchApp extends StatefulWidget {
  const StopWatchApp({Key? key}) : super(key: key);

  @override
  State<StopWatchApp> createState() => _StopWatchAppState();
}

class _StopWatchAppState extends State<StopWatchApp> {
  int milliseconds = 0;
  // late Timer timer;
  late Timer timer;
  final laps = <int>[];
  bool isTicking = false;
  final scrollController = ScrollController();
  final itemHeight = 60.0;

  void _stopTimer(BuildContext context) {
    timer.cancel();
    setState(() {
      isTicking = false;
    });

    // final totalRuntime =
    //     laps.fold(milliseconds, (previousValue, element) => null);
    // final alert = PlatformAlert
    // final scafoldState = GlobalKey<ScaffoldState>();

    // final controller =  showBottomSheet(context: context, builder: _buildRunCompleteSheet);
    // scafoldState.currentState!
    //     .showBottomSheet((contexts) => _buildRunCompleteSheet(context));

    // Future.delayed(Duration(seconds: 5)).then(
    //   (_) => controller.close(),
    // );
  }

  // _showAlert(BuildContext context) {
  //   showPlatformDialog(
  //     context: context,
  //     builder: (_) => BasicDialogAlert(
  //       title: Text('Current Location Not Available'),
  //       content:
  //           Text('Your current location can\'t be determined at this time'),
  //       actions: [
  //         BasicDialogAction(
  //           title: Text('Okay'),
  //           onPressed: () {
  //             Navigator.pop(context);
  //           },
  //         )
  //       ],
  //     ),
  //   );
  // }

  void _lap() {
    scrollController.animateTo(itemHeight * laps.length,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);

    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });
  }

  void _onTick(Timer timer) {
    // ++seconds // like this it also works as is
    setState(() {
      ++milliseconds; // this is an optional you can add it above this setState
    });
  }

  String _secondsText(int milliseconds) {
    final seconds = milliseconds / 1000;
    return '$seconds seconds';
  }

  void _startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 500), _onTick);

    setState(() {
      laps.clear();
      isTicking = true;
    });
  }

  Widget _buildLapDisplay() {
    return Scrollbar(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        controller: scrollController,
        itemExtent: itemHeight,
        itemCount: laps.length,
        itemBuilder: (context, index) {
          final milliseconds = laps[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 50),
            trailing: Text(_secondsText(milliseconds)),
            title: Text('Lap ${index + 1}'),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StopWatchApp'),
      ),
      body: Column(
        children: [
          Expanded(child: _buildCounter(context)),
          Expanded(child: _buildLapDisplay()),
          // Expanded(child: _buildRunCompleteSheet(context))
        ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: ),
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Lap ${laps.length + 1}',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: Colors.white),
          ),
          Text(
            _secondsText(milliseconds),
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 20),
          _buildControls(context),
        ],
      ),
    );
  }

  Widget _buildControls(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          /// If `isTicking` is `true` then the button disabled otherwise it enabled
          onPressed: isTicking ? null : _startTimer,
          child: Text('Start'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        ),
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: isTicking ? _lap : null,
          child: Text('Lap'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow)),
        ),
        SizedBox(width: 20),
        TextButton(
          /// `isTicking` is  `true` then the button is enabled otherwise it disabled
          onPressed:
              // isTicking
              //     ?
              () {
            _stopTimer(context);
          },
          // : null,
          child: Text('Stop'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        ),
      ],
    );
  }

  void dispose() {
    timer.cancel();
    super.dispose();
  }

  // Widget _buildRunCompleteSheet(BuildContext context) {
  //   // final totalRuntime =
  //   //     laps.fold(milliseconds, (int total, int lap) => total + lap);
  //   // String? previousValue;
  //   final totalRuntime =
  //       laps.fold(milliseconds, (previousValue, element) => element);
  //   print(totalRuntime);
  //   final textTheme = Theme.of(context).textTheme;

  //   return MaterialApp(
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: Text("Dialog Alert!"),
  //       ),
  //       body: SafeArea(
  //         child: Container(
  //           color: Theme.of(context).cardColor,
  //           width: double.infinity,
  //           child: Padding(
  //             padding: EdgeInsets.symmetric(vertical: 30.0),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Text(
  //                   'Run Finished!',
  //                   style: textTheme.headline6,
  //                 ),
  //                 Text('Total Run Time is ${_secondsText(totalRuntime)}')
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
