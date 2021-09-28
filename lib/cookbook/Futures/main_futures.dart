import 'dart:async';
import 'package:async/async.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:lsck/cookbook/Futures/geolocation.dart';

class MainFutures extends StatelessWidget {
  const MainFutures({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Futures Flutter',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const LocationScreen(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({Key? key}) : super(key: key);

  @override
  _FuturePageState createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  /// Note that you have to be aware of this it can be either null check or late initialization
  String? result;

  Completer? completer;

  Future<int> getNumber() {
    completer = Completer<int>();
    calculate();
    return completer!.future as Future<int>;
  }

  calculate() async {
    await Future.delayed(const Duration(seconds: 5));
    completer!.complete(42);
  }

  void returnFG() {
    FutureGroup<int> futureGroup = FutureGroup<int>();
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.close();
    futureGroup.future.then((List<int> value) {
      int total = 0;
      for (var element in value) {
        total += element;
      }
      setState(() {
        result = total.toString();
      });
    });
  }

  /// Catch Error
  catchErr(onError) {
    setState(() {
      result = onError;
    });
  }

  Future returnError() {
    throw ('Something terrible happened!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back from the Future'),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(
              child: const Text('Go!'),
              onPressed: () {
                returnError()
                    .then((value) {
                      setState(() {
                        result = 'Succed!';
                      });
                    })
                    .catchError(catchErr)
                    .whenComplete(() => print('Completed!'));
                // returnFG();
                // getNumber().then((value) {
                //   setState(() {
                //     result = value.toString();
                //   });
                // });
                // count();
              },
            ),
            const Spacer(),
            Text(result.toString()),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Future<Response> getData() async {
    const String authority = 'www.googleapis.com';
    const String path = '/books/v1/volumes/junbDwAAQBAJ';
    Uri url = Uri.http(authority, path);
    return http.get(url);
  }

  Future<int> returnOneAsync() async {
    // Mark with ? null in every <int> which is null
    await Future<int?>.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    // Mark with ? null in every <int> which is null
    await Future<int?>.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    // Mark with ? null in every <int> which is null
    await Future<int?>.delayed(const Duration(seconds: 3));
    return 3;
  }

  Future count() async {
    int total = 0;
    total = await returnOneAsync().then((value) {
      return total += value;
    });
    total += await returnTwoAsync().then((value) {
      return total += value;
    });
    total += await returnThreeAsync().then((value) {
      return total += value;
    });
    setState(() {
      result = total.toString();
    });
  }
}
