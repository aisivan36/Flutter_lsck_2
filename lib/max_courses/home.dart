import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Just an app'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Elevated Button'),
          const ElevatedButton(onPressed: null, child: Text('First')),
          ElevatedButton(onPressed: () {}, child: const Text('Second')),
          ElevatedButton(onPressed: () {}, child: const Text('Third')),
        ],
      ),
    );
  }
}
